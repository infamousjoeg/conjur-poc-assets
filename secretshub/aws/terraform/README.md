# terraform

## Usage

1. Adjust variables in [variables.tf]()
2. _[Optional]_ Export the environment variable name `TF_VAR_cyberark_oidc_client_secret` and set the value to the corresponding client_credentials secret for the CyberArk OIDC Service USer you wish to authenticate as. If not set, you will be prompted to enter the OIDC client_credentials secret when you run `terraform apply`.
3. Run `terraform init` to initialize the Terraform environment.
4. Run `terraform apply` to run the Terraform plan.