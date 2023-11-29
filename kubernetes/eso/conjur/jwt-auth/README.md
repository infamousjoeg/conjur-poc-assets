# jwt Authentication

This conjur provider uses a JSON Web Token (JWT) associated with a service account in Kubernetes to authenticate to Conjur.

## Usage

1. Update the following values in [secretStore.yaml]():
    1. `spec.provider.conjur.server.url` - The URL of your Conjur instance.
    2. `spec.provider.conjur.auth.jwt.serviceID` - The service ID of the authenticator in Conjur.
2. Apply the secretStore.yaml:

    ```bash
    kubectl apply -n external-secrets -f secretStore.yaml
    ```
3. Apply the externalSecret.yaml:

    ```bash
    kubectl apply -n external-secrets -f externalSecret.yaml
    ```