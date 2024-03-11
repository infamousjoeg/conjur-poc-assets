# secretshub/azure/arm

Azure Resource Management (ARM) template for deploying a POC ready environment inside an existing Resource Group for CyberArk's Secrets Hub.

## Usage

### Deploying the ARM template

The ARM template can be deployed using the Azure Portal, Azure CLI or PowerShell.

#### Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Finfamousjoeg%2Fconjur-poc-assets%2Fmain%2Fsecretshub%2Fazure%2Farm%2FSetupResourceGroup.json)

#### Bash

```bash
az deployment group create \
  --name SecretsHubPOC \
  --resource-group <resource-group-name> \
  --template-file https://raw.githubusercontent.com/infamousjoeg/conjur-poc-assets/main/secretshub/azure/arm/SetupResourceGroup.json
```

#### PowerShell

```powershell
New-AzResourceGroupDeployment `
  -Name SecretsHubPOC `
  -ResourceGroupName <resource-group-name> `
  -TemplateUri "https://raw.githubusercontent.com/infamousjoeg/conjur-poc-assets/main/secretshub/azure/arm/SetupResourceGroup.json"
```

### Registering Secrets Hub as an application in Azure AD

#### PowerShell

```powershell
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/infamousjoeg/conjur-poc-assets/main/secretshub/azure/arm/RegisterSecretsHub_EntraID.ps1" -UseBasicParsing).Content
```
