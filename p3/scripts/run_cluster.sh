k3d cluster delete -a
k3d cluster create iothings -p "8081:80@loadbalancer" --agents 2
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl create namespace dev
kubectl apply -f ../confs/wil42-config.yaml
