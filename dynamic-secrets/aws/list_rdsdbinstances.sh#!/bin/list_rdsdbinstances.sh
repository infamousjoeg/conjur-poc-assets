#!/bin/bash

source .env

# Ensure AWS credentials are set
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" || -z "$AWS_SESSION_TOKEN" ]]; then
    echo "❌ Error: AWS credentials are not set. Run the script to parse AWS_DYNAMIC_SECRET first."
    exit 1
fi

# Define AWS region (modify if needed)
AWS_REGION="us-east-1"

# List RDS DB instances
echo ""
echo "🔍 Fetching list of RDS DB instances in region: $AWS_REGION..."
aws rds describe-db-instances --region "$AWS_REGION" --output json || { 
    echo "❌ Failed to retrieve RDS instances. Check AWS credentials."; exit 1; 
}

echo ""
echo "✅ Successfully retrieved RDS DB instances."
