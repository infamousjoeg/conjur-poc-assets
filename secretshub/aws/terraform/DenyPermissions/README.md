# AllowSecretsAccess

## Usage

After granting Secrets Hub permission to sync your secrets, as described in Define "allow" role for Secrets Hub, we recommend that you apply a deny policy to all the other AWS roles that exist in your account.

Applying deny policies on roles other than the Secrets Hub role enforces least-privilege and ensures that AWS users don't perform actions that may interfere with Secrets Hub functionality and the integrity of the sync process.

1. `terraform init`
2. `terraform plan -out=secretshubplan`
3. `terraform apply secretshubplan`