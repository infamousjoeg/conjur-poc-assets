provider "cyberark" {
  tenant        = var.cyberark["tenant"]
  domain        = var.cyberark["domain"]
  client_id     = var.cyberark["oidc_client_id"]
  client_secret = var.cyberark_oidc_client_secret
}

resource "cyberark_aws_secret_store" "aws_store" {
  name               = var.aws["name"]
  description        = var.aws["description"]
  aws_account_alias  = var.aws["account_alias"]
  aws_account_id     = var.aws["account_id"]
  aws_account_region = var.aws["account_region"]
  aws_iam_role       = var.aws["iam_role"]
}