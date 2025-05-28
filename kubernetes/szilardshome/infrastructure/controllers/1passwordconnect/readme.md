# Create a new Vault for the Secrets
$ op vault create "k3s"

# Create a connect server in 1Password
op connect server create "Kubernetes" --vaults "k3s"

# The connect service expects the 1password-credentials.json in base64
kubectl create secret generic 1password-credentials -n external-secrets -from-literal=1password-credentials.json="$(cat ./1password-credentials.json | base64)"
