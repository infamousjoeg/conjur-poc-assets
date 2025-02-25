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
    name = "aws_policy"
    description = "Sync policy description"
    source_id = "store-50e75527-5813-497b-aaab-8cc5a296188e"
    target_id = "store-5e0a3c5c-b1b4-4994-92a5-77499f205835"
    safe_name = "TerraformCreatedSafe"
  }
}