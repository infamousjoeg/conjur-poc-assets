# secretshub/aws/terraform/CreateSyncPolicy

Terraform can automate the creation of a Sync Policy (1:1 relationship between CyberArk Safe & AWS Secrets Manager) in CyberArk's Secrets Hub. As of today, only creation is supported.

## Prerequisites

- Terraform 1.0 or newer
- CyberArk Service User w/ OIDC Client Credentials

## Usage

### 1. Clone this repository:
```bash
git clone https://github.com/infamousjoeg/conjur-poc-assets.git
cd secretshub/aws/terraform/CreateSyncPolicy
```

### 2. Set the variables present in [variables.tf](variables.tf).

### 3. Create the Target Secret Store Policy in Secrets Hub

```bash
terraform init
terraform plan
terraform apply"
```