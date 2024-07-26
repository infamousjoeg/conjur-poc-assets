# JWT Authentication with Kubernetes

1. Update `CONJUR_OR_EDGE_SERVICE` in [3_configmap.yaml]() to point to your Conjur Cloud or Conjur Cloud Edge service.
2. Create the namespace.
   1. `kubectl apply -f 1_namespace.yaml`
3. Create the service account for JWT authentication.
   1. `kubectl apply -f 2_serviceaccount.yaml`
4. Create the configmap for Conjur service connection and the shell script for POC use.
   1. `kubectl apply -f 3_configmap.yaml`
5. Create a centos container for us to test in.
   1. `kubectl apply -f 4_deployment.yaml`
6. Exec into the pod, target the app container.
   1. `kubectl exec -i -t -n authn-jwt-direct <INSERT_POD_NAME> -c k8s-jwt-app -- sh -c "clear; (bash || ash || sh)"`
7. Execute the shell script to test retrieval via API and JWT authentication.
   1. `./scripts/retrieve.sh`