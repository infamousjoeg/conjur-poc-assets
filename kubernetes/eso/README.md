# External Secrets Operator

The External Secrets Operator is a Kubernetes operator that manages the lifecycle of secrets from an external secret store, such as CyberArk Conjur.

## Usage

1. Install the External Secrets Operator in your cluster:

    ```bash
    helm repo add external-secrets https://charts.external-secrets.io

    helm install external-secrets \
        external-secrets/external-secrets \
            -n external-secrets \
            --create-namespace
    ```

2. Choose your authentication method and follow the README usage instructions for it.
   1. [API Key Authentication](conjur/apikey-auth/)
   2. [JWT Authentication](conjur/jwt-auth/)
   3. [Testing with fake Provider](fake/)
