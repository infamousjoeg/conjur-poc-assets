# secretshub/aws/terraform/CreateSafe

Terraform can automate the creation/deletion of a Safe in CyberArk's Privilege Cloud.

## Prerequisites

- Terraform 1.0 or newer
- CyberArk Service User w/ OIDC Client Credentials

## Usage

### 1. Clone this repository:
```bash
git clone https://github.com/infamousjoeg/conjur-poc-assets.git
cd terraform/CreateSafe
```

### 2. Set the variables present in [variables.tf](variables.tf).

### 3. Create the Target Secret Store Policy in Secrets Hub

```bash
terraform init
terraform plan
terraform apply"
```