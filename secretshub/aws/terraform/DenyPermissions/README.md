# secretshub/aws/terraform/DenyPermissions

After granting Secrets Hub permission to sync your secrets, as described in Define "allow" role for Secrets Hub, we recommend that you apply a deny policy to all the other AWS roles that exist in your account.

Applying deny policies on roles other than the Secrets Hub role enforces least-privilege and ensures that AWS users don't perform actions that may interfere with Secrets Hub functionality and the integrity of the sync process.

## Prerequisites

- Terraform 1.0 or newer
- AWS CLI, or
- AWS IAM credentials

## Usage

### 1. Clone this repository:
```bash
git clone https://github.com/infamousjoeg/conjur-poc-assets.git
cd secretshub/aws/terraform/AllowSecretsAccess
```

### 2. Authenticate to AWS

#### AWS CLI

Ensure you are logged in to AWS CLI:
```bash
aws configure
```

#### Using AWS IAM credentials

Export the necessary environment variables:
```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
```

#### Using Shared Credentials File

Ensure your AWS credentials file (~/.aws/credentials) is setup and export the profile name:

```bash
export AWS_PROFILE="your-profile-name"
```

#### Using an AWS IAM Role

Ensure your Terraform environment is on an AWS resource with the necessary IAM role attached.

### 3. Deploy the resources

```bash
terraform init
terraform apply
```