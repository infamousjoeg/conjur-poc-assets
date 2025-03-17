# terraform

## Use Cases

* [Create Safe](CreateSafe/README.md)
* [Onboard Database Account](OnboardDBAccount/README.md)
* [Retrieve Secret](main.tf)

## Other Terraform Use Cases

* [Create AWS Secret Store](../secretshub/aws/terraform/CreateAWSSecretStore/README.md)
* [Create Secrets Hub Sync Policy](../secretshub/aws/terraform/CreateSyncPolicy/README.md)
* [End-to-End Terraforming of Privilege Cloud & Secrets Hub](../secretshub/aws/terraform/main.tf)

## Usage (excluding Retrieve Secret)

1. Adjust variables in [variables.tf]()
2. _[Optional]_ Export the environment variable name `TF_VAR_cyberark_oidc_client_secret` and set the value to the corresponding client_credentials secret for the CyberArk OIDC Service USer you wish to authenticate as. If not set, you will be prompted to enter the OIDC client_credentials secret when you run `terraform apply`.
3. Run `terraform init` to initialize the Terraform environment.
4. Run `terraform apply` to run the Terraform plan.

## Usage for Retrieve Secret

1. Adjust variables in [variables.tf]()
   1. `conjur_appliance_url` should match the URL of your Conjur service. If Conjur Cloud (SaaS), it should end in `/api`.
   2. `conjur_account` should remain unchanged unless Conjur is self-hosted.
   3. `conjur_login` should be the ID of the Conjur Workload you wish to authenticate as. It should always be prefixed with `host/`.
2. Update Line 9 of [main.tf]() to match the name of the Conjur secret you wish to retrieve.
3. _[Optional]_ Export the environment variable name `TF_VAR_conjur_api_key` and set the value to the corresponding API Key for the Conjur Workload you wish to authenticate as. If not set, you will be prompted to enter the API Key when you run `terraform apply`.
4. Run `terraform init` to initialize the Terraform environment.
5. Run `terraform apply` to run the Terraform plan.