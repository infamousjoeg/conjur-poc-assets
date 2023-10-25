# terraform

## Usage

1. Adjust variables in [variables.tf]()
   1. `conjur_appliance_url` should match the URL of your Conjur service. If Conjur Cloud (SaaS), it should end in `/api`.
   2. `conjur_account` should remain unchanged unless Conjur is self-hosted.
   3. `conjur_login` should be the ID of the Conjur Workload you wish to authenticate as. It should always be prefixed with `host/`.
2. Update Line 9 of [main.tf]() to match the name of the Conjur secret you wish to retrieve.
3. _[Optional]_ Export the environment variable name `TF_VAR_conjur_api_key` and set the value to the corresponding API Key for the Conjur Workload you wish to authenticate as. If not set, you will be prompted to enter the API Key when you run `terraform apply`.
4. Run `terraform init` to initialize the Terraform environment.
5. Run `terraform apply` to run the Terraform plan.