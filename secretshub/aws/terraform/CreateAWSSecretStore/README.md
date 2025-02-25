# secretshub/aws/terraform/CreateTargetSecretStore

Terraform can automate the creation of a Target Secret Store policy in CyberArk's Secrets Hub. As of today, only creation is supported.

## Prerequisites

- Terraform 1.0 or newer
- CyberArk Service User w/ OIDC Client Credentials
- AWS IAM Role for Secrets Hub Access

## Usage

### 1. Clone this repository:
```bash
git clone https://github.com/infamousjoeg/conjur-poc-assets.git
cd secretshub/aws/terraform/CreateTargetSecretStore
```

### 2. Set the variables present in [variables.tf](variables.tf).

### 3. Create the Target Secret Store Policy in Secrets Hub

```bash
terraform init
terraform plan
terraform apply"
```