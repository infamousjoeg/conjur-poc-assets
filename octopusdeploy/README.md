# Octopus Deploy

This step reads a secret from CyberArk Conjur and makes them available as an Output Variable. Rest API is used and the details can be found at [https://docs.conjur.org/Latest/en/Content/Developer/Conjur_API_Retrieve_Secret.htm]().

## Parameters

- `CONJUR_ACCOUNT = conjur` - The account name of the Conjur instance. Conjur Cloud defaults to `conjur`.
- `CONJUR_APPLIANCE_URL = https://subdomain.secretsmgr.cyberark.cloud/api` - The URL of the Conjur instance. If using an Edge node, target the Edge node DNS instead.
- `CONJUR_AUTHN_LOGIN = host/cd/octopus/retrieve` - The login of the workload identity that will be used to authenticate with Conjur.
- `CONJUR_AUTHN_API_KEY = your-api-key` - The API key of the workload identity that will be used to authenticate with Conjur.
- `CONJUR_VARIABLE_ID = data/vault/ConjurCloudTestSafe/conjurtestaccount/password` - The ID of the variable to retrieve from Conjur.
- `CONJUR_OUTPUT_NAME = secret-output-variable` - The name of the output variable that will be created with the secret value.
- `CONJUR_STAY_SENSITIVE = True` - If set to `True`, the secret will not be printed to the logs. If set to `False`, the secret will be printed to the logs. Only disable this for debugging purposes in non-production environments.
- `CONJUR_FIX_SLASH_ENCODING = True` - PowerShell may incorrectly decode slashes in URL. If an error 404 is returned, toggling this option may fix the issue.

## Usage

Octopus Deploy Library: [https://library.octopus.com/step-templates/eafe9740-1008-4375-9e82-0d193109b669/actiontemplate-cyberark-conjur-retrieve-a-secret]()

1. Copy the JSON definition from [octopus.script.json]() and paste it into the _Library -> Step templates -> Import_ dialog.
2. Update parameter values as needed.