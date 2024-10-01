#!/bin/bash

# Prompt for user input to create secrets
read -rp "Enter Conjur URL: " conjur_url
read -rp "Enter Conjur Authn Login: " conjur_authn_login
read -rp "Enter Conjur Authn API Key: " conjur_authn_api_key
read -rp "Enter Conjur Account: " conjur_account
read -rp "Enter Secret Path: " secret_path

# Create Docker secrets
echo "$conjur_url" | docker secret create CONJUR_URL -
echo "$conjur_authn_login" | docker secret create CONJUR_AUTHN_LOGIN -
echo "$conjur_authn_api_key" | docker secret create CONJUR_AUTHN_API_KEY -
echo "$conjur_account" | docker secret create CONJUR_ACCOUNT -
echo "$secret_path" | docker secret create SECRET_PATH -

echo "Docker secrets created successfully."