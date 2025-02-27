#!/bin/bash

# Install Sealed-secrets manually
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm install sealed-secrets -n kube-system --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets

#Run the installation of ArgoCD
#kubectl apply -k /Users/alejandroprieto/projects/stock-cluster/applications/argocd
kubectl apply -k /Users/alejandroprieto/projects/stock-cluster/environments/development

# Chek the initial admin password
kubectl get secret -n argocd argocd-initial-admin-secret -o go-template='{{range $k,$v := .data}}{{"### "}}{{$k}}{{"\n"}}{{$v|base64decode}}{{"\n\n"}}{{end}}'

# Port-forward
kubectl -n argocd port-forward deployment/argocd-server 8080:8080
