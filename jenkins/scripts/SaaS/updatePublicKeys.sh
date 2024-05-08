#!/bin/bash

main() {
  check_env
  discover_service_urls
  parse_service_urls
  authenticate_identity_oidc
  authenticate_conjur_oidc
  update_public_keys
  logoff_identity
}

check_env() {
  # If env vars are not set, ask for them
  if [ -z "$IDENTITY_TENANT_SUBDOMAIN" ]; then
    read -rp "Enter the subdomain of your CyberArk Identity Security Platform tenant: " IDENTITY_TENANT_SUBDOMAIN
  fi
  if [ -z "$IDENTITY_USERNAME" ]; then
    read -rp "Enter the Service User's username: " IDENTITY_USERNAME
  fi
  if [ -z "$IDENTITY_PASSWORD" ]; then
    read -rsp "Enter the Service User's password: " IDENTITY_PASSWORD
    echo ""
  fi
  if [ -z "$CONJUR_SERVICE_ID" ]; then
    read -rp "Enter the Conjur service ID for the authn-jwt web service: " CONJUR_SERVICE_ID
  fi
  if [ -z "$CONJUR_JWKS_PUBLIC_KEYS" ]; then
    read -rp "Enter the Base64-encoded JWKS URI response: " CONJUR_JWKS_PUBLIC_KEYS
  fi
}

# Perform platform service discovery
discover_service_urls() {
  discovered_urls=$(curl --silent --location --globoff "https://platform-discovery.cyberark.cloud/api/v2/services/subdomain/$IDENTITY_TENANT_SUBDOMAIN")
  if [ -z "$discovered_urls" ]; then
    echo "Failed to discover service URLs"
    exit 1
  fi
}

# Extract the service URLs needed from the response
parse_service_urls() {
  conjur_url=$(echo "$discovered_urls" | jq -r '.secrets_manager.api')
  echo "+ Set Conjur URL to $conjur_url"
  identity_url=$(echo "$discovered_urls" | jq -r '.identity_user_portal.api')
  echo "+ Set Identity URL to $identity_url"
}

# Authenticate to CyberArk Identity
authenticate_identity_oidc() {
  identity_token=$(curl --silent --location --globoff "$identity_url/oauth2/platformtoken" \
  --header 'X-IDAP-NATIVE-CLIENT: true' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'grant_type=client_credentials' \
  --data-urlencode "client_id=$IDENTITY_USERNAME" \
  --data-urlencode "client_secret=$IDENTITY_PASSWORD" | jq -r '.access_token')
  echo "+ Authenticated to Identity as $IDENTITY_USERNAME"
}

# Authenticate to Conjur Cloud
authenticate_conjur_oidc() {
  conjur_token=$(curl --silent --location --globoff "$conjur_url/authn-oidc/cyberark/conjur/authenticate" \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --header 'Accept-Encoding: base64' \
  --data-urlencode "id_token=$identity_token")
  echo "+ Authenticated to Conjur as $IDENTITY_USERNAME using OIDC token"
}

# Update the public keys in Conjur for the authn-jwt service
update_public_keys() {
  decoded_jwks_pubkeys=$(echo "$CONJUR_JWKS_PUBLIC_KEYS" | tr -d '\r' | base64 -d | tr -d '\n')
  echo "+ Decoded JWKS Public Keys: $decoded_jwks_pubkeys"
  jwks_public_keys='{\"type\":\"jwks\",\"value\"'
  jwks_public_keys+=":$decoded_jwks_pubkeys}"
  echo "+ JWKS Public Keys: $jwks_public_keys"
  curl --silent --location --globoff "$conjur_url/secrets/conjur/variable/conjur/authn-jwt/$CONJUR_SERVICE_ID/public-keys" \
  --header 'Content-Type: text/plain' \
  --header "Authorization: Token token=\"$conjur_token\"" \
  --data-raw "$jwks_public_keys"
  echo "+ Updated public keys for authn-jwt service $CONJUR_SERVICE_ID"
}

logoff_identity() {
  curl --silent --location --globoff "$identity_url/Security/Logout" \
  --header 'X-IDAP-NATIVE-CLIENT: true' \
  --header "Authorization: Bearer $identity_token" > /dev/null 2>&1
  echo "+ Logged off from CyberArk Identity"
}

main '$@'