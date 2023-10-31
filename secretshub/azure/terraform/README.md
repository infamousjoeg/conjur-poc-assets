# secretshub/azure/terraform

This repository contains Terraform manifests for deploying resources on Azure for a POC of CyberArk's Secrets Hub.

## Prerequisites

- Terraform 1.0 or newer
- Azure CLI, or
- An Azure Service Principal

## Usage

### 1. Clone this repository
```bash
git clone https://github.com/infamousjoeg/conjur-poc-assets.git
cd secretshub/azure/terraform
```

### 2. Authenticate to Azure

#### Azure CLI

Ensure you are logged in to Azure CLI:
```bash
az login
```

#### Using a Service Principal with a Client Secret

Export the necessary environment variables:

```bash
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"
export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"
```

#### Using a Service Principal with a Client Certificate

Export the necessary environment variables:

```bash
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_CERTIFICATE_PATH="/path/to/your/client/certificate.pem"
export ARM_CLIENT_CERTIFICATE_PASSWORD="your-client-certificate-password"
export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_TENANT_ID="your-tenant-id"
```

#### Using a Managed Service Identity

Export the necessary environment variables:

```bash
export ARM_USE_MSI=true
```

### 3. Deploy the resources

```bash
terraform init
terraform apply
```