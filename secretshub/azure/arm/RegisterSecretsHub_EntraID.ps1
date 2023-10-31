param (
    [Parameter(Mandatory=$true)][string]$AppClientDisplayName,
    [Parameter(Mandatory=$true)][string]$KeyVaultName,
    [Parameter(Mandatory=$true)][string]$ResourceGroupName
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

# Create app registration
$appClient = New-AzADApplication -DisplayName $AppClientDisplayName

# Create the new service principal for the app
New-AzADServicePrincipal -ApplicationId $appClient.AppId | Out-Null

# Create credentials to access the created app, valid for a year
$clientSecret = New-AzADAppCredential -ApplicationId $appClient.AppId -EndDate (Get-Date).AddYears(1)

if ($keyVault.EnableRBACAuthorization) {
    Write-Output "$KeyVaultName's access configuration is of type RBAC. Creating new Role..."

    $azureSubscriptionId = (Get-AzContext).Subscription.Id
    $RoleDefinitionName = "Secrets-Hub-$KeyVaultName-$AppClientDisplayName-Role"

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

        $retryCount = 5
        $retryDelaySeconds = 1
        $success = $false

        for ($i = 1; $i -le $retryCount -and -not $success; $i++) {
            try {
                New-AzRoleAssignment -RoleDefinitionName $RoleDefinitionName `
                          -ApplicationId $appClient.AppId `
                          -Scope "/subscriptions/$azureSubscriptionId/resourceGroups/$ResourceGroupName/providers/Microsoft.KeyVault/vaults/$KeyVaultName"
                $success = $true
                Write-Output "Role permissions assigned successfully!"
            }
            catch {
                Write-Host "Attempt $i failed: $($_.Exception.Message)"

                Start-Sleep -Seconds $retryDelaySeconds

                if ($i -eq $retryCount) {
                    throw "Role permissions assignment failed. $($_.Exception.Message)"
                }
            }
        }
    } catch {
        throw $_.Exception
    }
} else {
    Write-Output "$KeyVaultName's access configuration is of type Vault Access Policy. Creating new access policy..."

    $appServicePrincipal = Get-AzADServicePrincipal -DisplayName $appClient.DisplayName

    if ($appServicePrincipal) {
        Set-AzKeyVaultAccessPolicy -VaultName $KeyVaultName `
            -ResourceGroupName $ResourceGroupName `
            -ObjectId $appServicePrincipal.Id `
            -PermissionsToSecrets get,set,list,delete,purge

        Write-Output "Access policy created successfully!"
    } else {
        throw "Access policy creation failed. $appClient.DisplayName application has no service principal."
    }
}

if ($clientSecret) {
    Write-Output "App created successfully with the relevant permissions!"

    Write-Output "App Client credentials:"
    # Returns Username
    $AppClientID = $appClient.AppId
    Write-Output "App Client ID = $AppClientID"

    # Return Password
    $ClientPassword = $clientSecret.SecretText
    Write-Output "App Client Secret = $ClientPassword"
} else {
    throw "App creation failed. $appClient.DisplayName application has no client secret."
}