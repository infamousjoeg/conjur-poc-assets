provider "cyberark" {
  tenant        = var.cyberark["tenant"]
  domain        = var.cyberark["domain"]
  client_id     = var.cyberark["oidc_client_id"]
  client_secret = var.cyberark_oidc_client_secret
}

locals {
  cyberark_account_name = "${var.cyberark_account["address"]}-${var.cyberark_account["username"]}"
}

resource "cyberark_db_account" "postgresql" {
  name                        = local.cyberark_account_name
  address                     = var.cyberark_account["address"]
  username                    = var.cyberark_account["username"]
  platform                    = var.cyberark_account["platform"]
  safe                        = var.cyberark_account["safe"]
  secret                      = var.cyberark_account_secret
  secret_name_in_secret_store = var.cyberark_account["username"]
  sm_manage                   = var.cyberark_account["sm_manage"]
  sm_manage_reason            = var.cyberark_account["sm_manage_reason"]
  db_port                     = var.cyberark_account["db_port"]
  dbname                      = var.cyberark_account["dbname"]
}