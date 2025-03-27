variable "cyberark_oidc_client_secret" {
  description = "OIDC client_credentials Client Secret for CyberArk Service User"
  type        = string
  sensitive   = true
}

variable "cyberark" {
  type = map(string)
  default = {
    tenant         = "aap4212"
    domain         = "pineapple"
    oidc_client_id = "terraform@pineappledev.app"
  }
}

variable "aws" {
  type    = map(string)
  default = {
    name           = "aws_store"
    description    = "AWS Secret Store policy"
    account_alias     = "TestingTerraform"
    account_id        = "735280068473"
    account_region    = "us-west-2"
    iam_role          = "arn:aws:iam::735280068473:role/PineappleSecretsHubRoleCreat-AllowSecretsAccessRole-DBeRlLDpnCfV"
  }
}

variable "cyberark_sync" {
  type    = map(string)
  default = {
    name           = "aws_policy"
    description    = "Sync policy description"
    source_id         = "store-50e75527-5813-497b-aaab-8cc5a296188e"
    target_id         = "store-5e0a3c5c-b1b4-4994-92a5-77499f205835"
  }
}

variable "cyberark_safe" {
  type    = map(string)
  default = {
    safe_name         = "TerraformCreatedSafe"
    safe_desc         = "Safe created by Terraform"
    member            = "SecretsHub"
    member_type       = "User"
    permission_level  = "full"
    retention         = 0
    purge             = false
    cpm_name          = "PasswordManager"
    safe_loc          = ""
  }
}

variable "cyberark_account" {
  type    = map(string)
  default = {
    address                     = "database.example.com"
    username                    = "postgres"
    platform                    = "PostgreSQL"
    sm_manage                   = false
    sm_manage_reason            = "Testing for POC Purposes"
    db_port                     = "5432"
    dbname                      = "postgres"
  }
}

variable "cyberark_account_secret" {
  description = "Onboarded account secret value"
  type        = string
  sensitive   = true
}
