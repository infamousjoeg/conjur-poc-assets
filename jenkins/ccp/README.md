# Jenkinsfile for CyberArk CCP Integration

This repository contains a Jenkinsfile that demonstrates how to retrieve credentials from CyberArk's Central Credential Provider (CCP) using the `curl` command. The retrieved credentials can be used in subsequent stages of the Jenkins pipeline.

## Prerequisites

- Jenkins installed and configured
- CyberArk Central Credential Provider (CCP) accessible
- Valid Application Identity (App ID) for CCP

## Configuration

Before running the Jenkins pipeline, ensure the following environment variables are correctly configured in the Jenkinsfile:

- `CCP_URL`: The URL of the CyberArk CCP API.
- `APP_ID`: The application ID registered in CyberArk for accessing the CCP.
- `SAFE`: The safe name in CyberArk where the credentials are stored.
- `USERNAME`: The username for the credential being retrieved.

## Jenkinsfile Overview

The provided Jenkinsfile performs the following steps:

1. **Get Credentials from CyberArk CCP**:
   - Uses `curl` to make an authenticated request to the CCP.
   - Retrieves the credentials for the specified `APP_ID`, `SAFE`, and `USERNAME`.
   - Parses the JSON response and extracts the password.
   - Stores the retrieved password in an environment variable for use in subsequent pipeline stages.
