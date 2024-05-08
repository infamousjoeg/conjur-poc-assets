# Jenkins/Scripts

This directory contains scripts that are used by Jenkins to automate various tasks.

## Scripts

### SaaS/updatePublicKeys.sh

[Go to file...](SaaS/updatePublicKeys.sh)

This script is used to update the public keys configured in Conjur Cloud for Jenkins to use authn-jwt to authenticate with Conjur. Rather than reaching out to a JWKS URI to fetch the public keys, Conjur Cloud will use the stored public keys for verification of the received JSON Web Token (JWT).

#### Usage

The authenticator's public keys variable in Conjur Cloud should already be created. The script will update the public keys stored in the variable.

##### Parameters

These parameters can be set as environment variables or will be prompted for when the script is run.

| Parameter | Description |
| --- | --- |
| IDENTITY_TENANT_SUBDOMAIN | The subdomain of the Identity Security Platform tenant. |
| IDENTITY_USERNAME | The username of the Identity Security Platform service user. Normal users are not supported. |
| IDENTITY_PASSWORD | The password of the Identity Security Platform service user. |
| CONJUR_SERVICE_ID | The service ID of the Conjur authn-jwt service. _(e.g. jenkins1)_ |
| CONJUR_JWKS_PUBLIC_KEYS | The response from the JWKS URI in Jenkins, in base64-encoded format. |