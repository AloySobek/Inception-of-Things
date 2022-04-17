curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

if echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check; then
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
fi

rm kubectl
rm kubectl.sha256
