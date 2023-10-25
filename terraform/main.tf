provider "conjur" {
  appliance_url        = local.conjur_appliance_url
  account              = local.conjur_account
  login                = local.conjur_login
  api_key              = var.conjur_api_key
}

data "conjur_secret" "conjur_test_account_address" {
  name = "data/vault/ConjurCloudTestSafe/conjurtestaccount/address"
}

output "conjur_test_account_address_value" {
  value = data.conjur_secret.conjur_test_account_address.value
  sensitive = true
}
