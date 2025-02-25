provider "cyberark" {
  tenant        = var.cyberark["tenant"]
  domain        = var.cyberark["domain"]
  client_id     = var.cyberark["oidc_client_id"]
  client_secret = var.cyberark_oidc_client_secret
}

resource "cyberark_sync_policy" "syncpolicy" {
  name           = var.cyberark_sync["name"]
  description    = var.cyberark_sync["description"]
  source_id      = var.cyberark_sync["source_id"]
  target_id      = var.cyberark_sync["target_id"]
  safe_name      = var.cyberark_sync["safe_name"]
}