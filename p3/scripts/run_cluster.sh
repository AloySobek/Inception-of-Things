#!/bin/bash
k3d cluster delete iothings
k3d cluster create iothings -p "8081:80@loadbalancer" --agents 2
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=available --timeout=9000s deployment/argocd-server -n argocd
kubectl apply -f ../confs/wil42-config.yaml
