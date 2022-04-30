#!/bin/bash

# Cleanup iothings cluster
k3d cluster delete iothings

# Create cluster with 1% free space eviction policy
# And expose 80/443 port for loadbalancer
k3d cluster create iothings \
  -p "80:80@loadbalancer" -p "443:443@loadbalancer" --agents 1 \
  --k3s-arg '--kubelet-arg=eviction-hard=imagefs.available<1%,nodefs.available<1%@agent:*' \
  --k3s-arg '--kubelet-arg=eviction-minimum-reclaim=imagefs.available=1%,nodefs.available=1%@agent:*'

kubectl config use-context k3d-iothings

# Add gitlab helm repository
helm repo add gitlab https://charts.gitlab.io/
helm repo update

# Install/Upgrade gitlab helm charts using values from confs
helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  --create-namespace \
  --timeout 600s \
  -f ../confs/gitlab-helm-values.yaml

# As we installing without Ingress create one for gitlab
kubectl apply -f ../confs/gitlab-ingress.yaml

# Installl agrocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Add out test ArgoCd Application
kubectl apply -f ../confs/argocd-app-wil42.yaml

# Wait for gitlab to start
echo "Waiting 9000s for gitlab.. Usually well start in ~10 minutes"
kubectl wait --for=condition=available --timeout=9000s deployment/gitlab-webservice-default -n gitlab
echo "Gitlab is Ready!"

echo "Username: root"
echo "Password: $(kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath='{.data.password}' | base64 --decode)"

echo "Add"
echo "127.0.0.1 gitlab.k3d.local"
echo "To /etc/hosts"
echo "And reload with"
echo "pkill -HUP dnsmasq"
echo "................."
echo "Got go http://gitlab.k3d.local to aces your gitlab instance!"
