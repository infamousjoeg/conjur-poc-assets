# jwt Authentication

This conjur provider uses a JSON Web Token (JWT) associated with a service account in Kubernetes to authenticate to Conjur.

## Usage

1. Update the following values in [secretStore.yaml]():
    1. `spec.provider.conjur.server.url` - The URL of your Conjur instance. [Line 9](https://github.com/infamousjoeg/conjur-poc-assets/blob/e497ddcf7ebb73b400062b0f29ab66a8ce44f5b8/kubernetes/eso/conjur/jwt-auth/secretStore.yaml#L9)
    2. `spec.provider.conjur.auth.jwt.serviceID` - The service ID of the authenticator in Conjur. [Line 17](https://github.com/infamousjoeg/conjur-poc-assets/blob/bbd48363095d1b70ec08739e41f36bf606480967/kubernetes/eso/conjur/jwt-auth/secretStore.yaml#L17)
2. Apply the secretStore.yaml:

    ```bash
    kubectl apply -n external-secrets -f secretStore.yaml
    ```
3. Apply the externalSecret.yaml:

    ```bash
    kubectl apply -n external-secrets -f externalSecret.yaml
    ```
