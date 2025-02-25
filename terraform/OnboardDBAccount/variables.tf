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

variable "cyberark_account" {
  type    = map(string)
  default = {
    address                     = "database.example.com"
    username                    = "postgres"
    platform                    = "PostgreSQL"
    safe                        = "TerraformCreatedSafe"
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