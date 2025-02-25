provider "cyberark" {
  tenant        = var.cyberark["tenant"]
  domain        = var.cyberark["domain"]
  client_id     = var.cyberark["oidc_client_id"]
  client_secret = var.cyberark_oidc_client_secret
}

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