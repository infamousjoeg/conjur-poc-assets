#!/bin/bash
set -eou pipefail

conjur_policy_file="./policy/conjurpolicy.yml"

# Check that relative path to policy file exists
if [ ! -f "$conjur_policy_file" ]; then
    echo "Error: $conjur_policy_file does not exist."
    echo "Please be sure to run conjurpolicy.sh from within the project's dynamic-secrets/aws directory."
    exit 1
fi

conjur policy load -b data/dynamic -f $conjur_policy_file