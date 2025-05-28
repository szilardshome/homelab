# Create a new Vault for the Secrets
$ op vault create "k3s"

# Create a connect server in 1Password
op connect server create "Kubernetes" --vaults "k3s"

# The connect service expects the 1password-credentials.json in base64
kubectl create secret generic 1password-credentials -n 1passwordconnect --from-literal=1password-credentials.json="$(cat ./1password-credentials.json  | base64)"

# Create the token and save it in the OP_CONNECT_TOKEN environment variable 
export OP_CONNECT_TOKEN=$(op connect token create "external-secret-operator" --server "Kubernetes" --vault "k3s")

# Create secret with the token which is used by the External-Secret-Operator ClusterSecretStore
kubectl create secret -n 1passwordconnect generic 1password-operator-token --from-literal=token=$OP_CONNECT_TOKEN

kubectl create secret generic 1passwordconnect \
  --from-literal=token=$OP_CONNECT_TOKEN \
  --namespace external-secrets