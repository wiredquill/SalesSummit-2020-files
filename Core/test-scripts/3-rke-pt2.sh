#/bin/bash

mkdir /home/tux/.kube
cp kube_config_cluster.yml /home/tux/.kube/config

kubectl get nodes

sudo wget -O helm.tar.gz https://get.helm.sh/helm-v3.3.0-linux-amd64.tar.gz
tar -zxvf helm.tar.gz
sudo mv linux-amd64/helm /usr/local/bin
sudo chmod +x /usr/local/bin/helm

kubectl create namespace cert-manager
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml

helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
     cert-manager --namespace cert-manager \
     --version v0.12.0 \
     jetstack/cert-manager

kubectl -n cert-manager rollout status deploy/cert-manager-webhook

kubectl -n cert-manager rollout status deploy/cert-manager
