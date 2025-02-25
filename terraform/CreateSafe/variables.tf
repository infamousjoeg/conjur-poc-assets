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

variable "cyberark_safe" {
  type    = map(string)
  default = {
    safe_name         = "TerraformCreatedSafe"
    safe_desc         = "Safe created by Terraform"
    member            = "joe.garcia@pineappledev.app"
    member_type       = "User"
    permission_level  = "full"
    retention         = 0
    purge             = false
    cpm_name          = "PasswordManager"
    safe_loc          = ""
  }
}