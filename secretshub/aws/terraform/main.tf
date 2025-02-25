// Connect to CyberArk Identity Security Platform
provider "cyberark" {
  tenant        = var.cyberark["tenant"]
  domain        = var.cyberark["domain"]
  client_id     = var.cyberark["oidc_client_id"]
  client_secret = var.cyberark_oidc_client_secret // Provided as TF_VAR_cyberark_oidc_client_secret env variable
}

// Create safe in Privilege Cloud
// Safe `member` is `Secrets Hub` to ensure safe is enabled for sync
resource "cyberark_safe" "terraform_created_safe" {
  safe_name               = var.cyberark_safe["safe_name"]
  safe_desc               = var.cyberark_safe["safe_desc"]
  member                  = var.cyberark_safe["member"]
  member_type             = var.cyberark_safe["member_type"]
  permission_level        = var.cyberark_safe["permission_level"]
  retention               = var.cyberark_safe["retention"]
  purge                   = var.cyberark_safe["purge"]
  cpm_name                = var.cyberark_safe["cpm_name"]
  safe_loc                = var.cyberark_safe["safe_loc"]
}

// Generate random password
resource "random_password" "cyberark_password" {
  length  = 16
  special = false
}

// Create account name for Privilege Cloud
locals {
  cyberark_account_name = "${var.cyberark_account["address"]}-${var.cyberark_account["username"]}"
}

// Onboard `postgres` database user into Privilege Cloud
resource "cyberark_db_account" "postgresql" {
  name                        = local.cyberark_account_name // Use local variable to create account name
  address                     = var.cyberark_account["address"]
  username                    = var.cyberark_account["username"]
  platform                    = var.cyberark_account["platform"]
  safe                        = var.cyberark_safe["safe_name"]
  secret                      = var.cyberark_account_secret // Use random password generated
  secret_name_in_secret_store = var.cyberark_account["username"]
  sm_manage                   = var.cyberark_account["sm_manage"]
  sm_manage_reason            = var.cyberark_account["sm_manage_reason"]
  db_port                     = var.cyberark_account["db_port"]
  dbname                      = var.cyberark_account["dbname"]
}

// Create AWS Secrets Manager secret store in Secrets Hub
resource "cyberark_aws_secret_store" "aws_store" {
  name               = var.aws["name"]
  description        = var.aws["description"]
  aws_account_alias  = var.aws["account_alias"]
  aws_account_id     = var.aws["account_id"]
  aws_account_region = var.aws["account_region"]
  aws_iam_role       = var.aws["iam_role"]
}

// Create Sync Policy between CyberArk Safe & AWS Secrets Manager in Secrets Hub
resource "cyberark_sync_policy" "syncpolicy" {
  name           = var.cyberark_sync["name"]
  description    = var.cyberark_sync["description"]
  source_id      = var.cyberark_sync["source_id"]
  target_id      = cyberark_aws_secret_store.aws_store.id // Use previously created secret store ID
  safe_name      = var.cyberark_safe["safe_name"]
}