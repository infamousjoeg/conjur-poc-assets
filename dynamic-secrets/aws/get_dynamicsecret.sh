#!/bin/bash

if ! command -v conjur &> /dev/null; then
    echo "❌ Error: conjur-cli (Conjur Cloud CLI) is not installed."
    exit 1
fi
echo "✅ conjur-cli is installed."

if ! command -v aws &> /dev/null; then
    echo "❌ Error: aws-cli is not installed."
    echo "🔹 Install it using:"
    echo "  - Debian/Ubuntu: sudo apt install awscli"
    echo "  - Snap: sudo snap install aws-cli --classic"
    echo "  - Amazon Linux/CentOS: sudo yum install aws-cli"
    echo "  - macOS: brew install awscli"
    exit 1
fi
echo "✅ aws-cli is installed."

# Get AWS dynamic secret from Conjur Cloud
AWS_DYNAMIC_SECRET=$(conjur variable get -i "data/dynamic/productcatalog-cyberark-shop")

# Parse AWS credentials from JSON
access_key=$(echo "$AWS_DYNAMIC_SECRET" | jq -r '.data.access_key_id')
secret_key=$(echo "$AWS_DYNAMIC_SECRET" | jq -r '.data.secret_access_key')
session_token=$(echo "$AWS_DYNAMIC_SECRET" | jq -r '.data.session_token')
federated_user_arn=$(echo "$AWS_DYNAMIC_SECRET" | jq -r '.data.federated_user_arn')

# Export AWS credentials as environment variables
{ echo "export AWS_ACCESS_KEY_ID=$access_key"; echo "export AWS_SECRET_ACCESS_KEY=$secret_key"; echo "export AWS_SESSION_TOKEN=$session_token"; echo "export AWS_FEDERATED_USER_ARN=$federated_user_arn"; } > .env

source .env

# Check if the credentials were parsed correctly
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" || -z "$AWS_SESSION_TOKEN" ]]; then
    echo "❌ Error: Failed to parse AWS credentials."
    exit 1
fi

# Display parsed credentials (masking secret for security)
echo ""
echo "✅ Successfully parsed AWS credentials:"
echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY: (hidden for security)"
echo "AWS_FEDERATED_USER_ARN: $AWS_FEDERATED_USER_ARN"
echo "AWS_SESSION_TOKEN: (hidden for security)"

# Test authentication
echo ""
echo "🔍 Verifying AWS credentials..."
aws sts get-caller-identity --output table || { echo "❌ AWS authentication failed."; exit 1; }

echo ""
echo "✅ AWS credentials successfully authenticated!"
