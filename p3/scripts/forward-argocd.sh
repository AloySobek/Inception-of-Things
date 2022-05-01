#!/bin/bash
echo "Username: admin"
echo "Password: $(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 --decode)"
echo "https://localhost:4443"
kubectl port-forward --address 0.0.0.0 service/argocd-server 4443:443 -n argocd
