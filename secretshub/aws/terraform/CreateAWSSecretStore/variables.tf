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
    name             = "aws_store"
    description      = "AWS store for testing purpose"
    account_alias    = "TestingTerraform"
    account_id       = "735280068473"
    account_region   = "us-west-2"
    iam_role         = "arn:aws:iam::735280068473:role/PineappleSecretsHubRoleCreat-AllowSecretsAccessRole-DBeRlLDpnCfV"
  }
}