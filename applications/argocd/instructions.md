# Install sealed-secrets manually with controller
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets 

# Create private-repo-creds sealed secret
./create_sealed_secret.sh private-repo-creds.unsealed.secret.yaml

1. To initialize argocd CRDS run: 
run kubectl apply -k /Users/alejandroprieto/projects/stock-cluster/environments/development/argocd 

2. To configure argoCD in the environment run:
Run kubectl apply -k /Users/alejandroprieto/projects/stock-cluster/environments/development 

