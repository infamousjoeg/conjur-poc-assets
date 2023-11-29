# apikey Authentication

This conjur provider uses a Workload Identity with API Key to authenticate to Conjur.

## Usage

1. Create a Kubernetes Secret containing your Workload ID & API Key for authentication:

    ```bash
    kubectl create secret generic conjur-creds \
        --from-literal=workloadid=<WORKLOAD_ID> \
        --from-literal=apikey=<API_KEY>
    ```
2. Update the following values in [secretStore.yaml]():
    1. `spec.provider.conjur.server.url` - The URL of your Conjur instance.
3. Apply the secretStore.yaml:

    ```bash
    kubectl apply -n external-secrets -f secretStore.yaml
    ```
4. Apply the externalSecret.yaml:

    ```bash
    kubectl apply -n external-secrets -f externalSecret.yaml
    ```