param (
    [Parameter(Mandatory = $true)]
    [string]$AppClientDisplayName,
    
    [Parameter(Mandatory = $true)]
    [string]$KeyVaultName,
    
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName
)

$ErrorActionPreference = "Stop"

if (-not (Get-AzResourceGroup -Name $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue)) {
    throw "App registration creation failed. Resource group $ResourceGroupName does not exist in subscription"
}

$appExists = Get-AzADApplication -DisplayName $AppClientDisplayName
$keyVault = Get-AzKeyVault -ResourceGroupName $ResourceGroupName -VaultName $KeyVaultName

if (-not ($keyVault)) {
    throw "App registration creation failed. Key Vault $KeyVaultName does not exist in resource group"
}
if ($appExists) {
    throw "Application named $AppClientDisplayName already exists in your subscription"
}

$appClient = New-AzADApplication -DisplayName $AppClientDisplayName
New-AzADServicePrincipal -ApplicationId $appClient.AppId | Out-Null
$clientSecret = New-AzADAppCredential -ApplicationId $appClient.AppId -EndDate (Get-Date).AddYears(1)

if ($keyVault.EnableRBACAuthorization) {
    Write-Output "$KeyVaultName's access configuration is of type RBAC. Creating new Role..."
    $azureSubscriptionId = (Get-AzContext).Subscription.Id
    $RoleDefinitionName = "Secrets-Hub-$KeyVaultName-Role"
    try {
        $roleDefinition = [Microsoft.Azure.Commands.Resources.Models.Authorization.PSRoleDefinition]::new()
        $roleDefinition.Name = $RoleDefinitionName
        $roleDefinition.Description = "provide read-write access to secrets in key vault"
        $roleDefinition.Actions = @()
            $roleDefinition.Actions.Add("Microsoft.KeyVault/vaults/secrets/write")
            $roleDefinition.Actions.Add("Microsoft.KeyVault/vaults/secrets/read")
        $roleDefinition.DataActions = @()
            $roleDefinition.DataActions.Add("Microsoft.KeyVault/vaults/secrets/delete")
            $roleDefinition.DataActions.Add("Microsoft.KeyVault/vaults/secrets/purge/action")
            $roleDefinition.DataActions.Add("Microsoft.KeyVault/vaults/secrets/update/action")
            $roleDefinition.DataActions.Add("Microsoft.KeyVault/vaults/secrets/getSecret/action")
            $roleDefinition.DataActions.Add("Microsoft.KeyVault/vaults/secrets/setSecret/action")
            $roleDefinition.DataActions.Add("Microsoft.KeyVault/vaults/secrets/readMetadata/action")
            $roleDefinition.AssignableScopes = @("/subscriptions/$azureSubscriptionId/resourceGroups/$ResourceGroupName/providers/Microsoft.KeyVault/vaults/$KeyVaultName")
        
        New-AzRoleDefinition -Role $roleDefinition
        Write-Output "$RoleDefinitionName created successfully!"
        
        New-AzRoleAssignment -RoleDefinitionName $RoleDefinitionName `
            -ApplicationId $appClient.AppId `
            -Scope "/subscriptions/$azureSubscriptionId/resourceGroups/$ResourceGroupName/providers/Microsoft.KeyVault/vaults/$KeyVaultName"
        Write-Output "Role permissions assigned successfully!"
    } catch { throw $_.Exception; }
} else {
    Write-Output "$KeyVaultName's access configuration is of type Vault Access Policy. Creating new access policy..."
    $appServicePrincipal = Get-AzADServicePrincipal -DisplayName $appClient.DisplayName
    
    if ($appServicePrincipal) {
        Set-AzKeyVaultAccessPolicy -VaultName $KeyVaultName `
        -ResourceGroupName $ResourceGroupName `
        -ObjectId $appServicePrincipal.Id `
        -PermissionsToSecrets get, set, list, delete, purge
        
        Write-Output "Access policy created successfully!"
    } else {
        throw "Access policy creation failed. $appClient.DisplayName application has no service principal."
    }
}

if ($clientSecret) {
    Write-Output "App created successfully with the relevant permissions!"
    Write-Output "App Client credentials:"
    $AppClientID = $appClient.AppId
    Write-Output "App Client ID = $AppClientID"
    $ClientPassword = $clientSecret.SecretText
    Write-Output "App Client Secret = $ClientPassword"
    Write-Output "Please save these credentials in a safe place. You will need them to configure Secrets Hub."
} else {
    throw "App registration creation failed. Client secret could not be generated."
}