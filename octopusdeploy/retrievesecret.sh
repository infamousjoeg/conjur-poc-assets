#!/bin/bash

# Set TLS 1.2
export CURL_SSL_VERSION="--tlsv1.2"

# Function to create URI without incorrect slash encoding
create_uri_without_incorrect_slash_encoding() {
  local uri="$1"
  echo "$uri" | sed 's/%2F/\//g'
}

CONJUR_APPLIANCE_URL="#{CONJUR_APPLIANCE_URL}" # e.g. https://subdomain.secretsmgr.cyberark.cloud/api
CONJUR_ACCOUNT="#{CONJUR_ACCOUNT}" # e.g. conjur
CONJUR_AUTHN_LOGIN="#{CONJUR_AUTHN_LOGIN}" # e.g. host/cd/octopus/retrieve
CONJUR_AUTHN_API_KEY="#{CONJUR_AUTHN_API_KEY}"
VARIABLE_ID="#{CONJUR_VARIABLE_ID}"

encoded_login=$(echo "$CONJUR_AUTHN_LOGIN" | sed 's/\//%2F/g')
encoded_path=$(echo "$VARIABLE_ID" | sed 's/\//%2F/g')

headers=(
  -H "Content-Type: application/json"
  -H "Accept-Encoding: base64"
)

body="$CONJUR_AUTHN_API_KEY"

url1="$CONJUR_APPLIANCE_URL/authn/$CONJUR_ACCOUNT/$encoded_login/authenticate"
if [ "#{CONJUR_FIX_SLASH_ENCODING}" == "True" ]; then
  url1=$(create_uri_without_incorrect_slash_encoding "$url1")
fi

response=$(curl -s "${headers[@]}" -X POST --data "$body" "$url1" $CURL_SSL_VERSION)

token="Token token=\"$response\""

headers=(
  -H "Authorization: $token"
)

url2="$CONJUR_APPLIANCE_URL/secrets/$CONJUR_ACCOUNT/variable/$encoded_path"
if [ "#{CONJUR_FIX_SLASH_ENCODING}" == "True" ]; then
  url2=$(create_uri_without_incorrect_slash_encoding "$url2")
fi

secretvalue=$(curl -s "${headers[@]}" -X GET "$url2" $CURL_SSL_VERSION)

sensitive_output_variables_supported=$(type -t set_octopus_variable)

if [ "$sensitive_output_variables_supported" ] && [ "#{CONJUR_STAY_SENSITIVE}" == "True" ]; then
  set_octopus_variable "#{CONJUR_OUTPUT_NAME}" "$secretvalue" --sensitive
else
  set_octopus_variable "#{CONJUR_OUTPUT_NAME}" "$secretvalue"
fi
