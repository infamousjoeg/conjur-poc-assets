locals {
    # The URL of the Conjur Secrets Manager service
    conjur_appliance_url = "https://subdomain.secretsmgr.cyberark.cloud/api"

    # The name of the Conjur account
    conjur_account = "conjur"

    # The Conjur Workload ID
    # NOTE: Be sure to prefix the Conjur Workload ID with "host/"
    conjur_login = "host/data/cd/terraform/dev-team-1/applications/aws_test1"
}

variable "conjur_api_key" {
    type = string
    description = "The API key for the Conjur Workload ID: " + local.conjur_login  
}