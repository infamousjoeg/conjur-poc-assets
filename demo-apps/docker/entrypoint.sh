#!/bin/bash

# Load secrets from the Docker secrets files
CONJUR_URL=$(cat /run/secrets/CONJUR_URL)
CONJUR_AUTHN_LOGIN=$(cat /run/secrets/CONJUR_AUTHN_LOGIN)
CONJUR_AUTHN_API_KEY=$(cat /run/secrets/CONJUR_AUTHN_API_KEY)
CONJUR_ACCOUNT=$(cat /run/secrets/CONJUR_ACCOUNT)
SECRET_PATH=$(cat /run/secrets/SECRET_PATH)

# URL-encode the login
CONJUR_AUTHN_LOGIN=$(echo -n "$CONJUR_AUTHN_LOGIN" | jq -s -R -r @uri)

# Authenticate to Conjur and retrieve a session token
AUTHN_TOKEN=$(curl -s -X POST \
  -H "Accept-Encoding: base64" \
  --data "$CONJUR_AUTHN_API_KEY" \
  "$CONJUR_URL/authn/$CONJUR_ACCOUNT/$CONJUR_AUTHN_LOGIN/authenticate")

# Encode token to Base64 (Conjur REST API expects this)
AUTH_HEADER="Authorization: Token token=\"$AUTHN_TOKEN\""

# Retrieve the secret from Conjur
SECRET_VALUE=$(curl -s -X GET \
  -H "$AUTH_HEADER" \
  "$CONJUR_URL/secrets/$CONJUR_ACCOUNT/variable/$SECRET_PATH")

# Check if the retrieval was successful
if [ -z "$SECRET_VALUE" ]; then
  echo "Failed to retrieve secret from Conjur"
  exit 1
fi

echo "Retrieved secret value: $SECRET_VALUE"

# Continue to execute the default command
exec "$@"