#!/bin/bash

if ! command -v psql &> /dev/null; then
    echo "❌ Error: psql (PostgreSQL client) is not installed."
    echo "🔹 Install it using:"
    echo "  - Debian/Ubuntu: sudo apt install postgresql-client"
    echo "  - Amazon Linux/CentOS: sudo yum install postgresql"
    echo "  - macOS: brew install libpq && brew link --force libpq"
    exit 1
fi
echo "✅ psql is installed."

source .env

# Validate credentials
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" || -z "$AWS_SESSION_TOKEN" ]]; then
    echo "❌ Error: Failed to extract AWS credentials from Conjur."
    exit 1
fi

# Set database connection details
RDS_HOST="productcatalog-cyberark-shop.cluster-ro-csniyts1dh2a.us-east-1.rds.amazonaws.com"
RDS_PORT=5432
RDS_USER="postgresql"
#RDS_DB="your_database"

# Generate IAM authentication token
echo ""
echo "🔍 Generating IAM authentication token for PostgreSQL..."
RDS_AUTH_TOKEN=$(aws rds generate-db-auth-token \
    --hostname "$RDS_HOST" \
    --port "$RDS_PORT" \
    --region us-east-1 \
    --username "$RDS_USER")

if [[ -z "$RDS_AUTH_TOKEN" ]]; then
    echo "❌ Error: Failed to generate RDS IAM authentication token."
    exit 1
fi

echo "✅ IAM authentication token generated."

# Connect to PostgreSQL using psql
echo ""
echo "🔗 Connecting to PostgreSQL database..."
PGPASSWORD="$RDS_AUTH_TOKEN" psql \
    --host="$RDS_HOST" \
    --port="$RDS_PORT" \
    --username="$RDS_USER" #\
    #--dbname="$RDS_DB"
