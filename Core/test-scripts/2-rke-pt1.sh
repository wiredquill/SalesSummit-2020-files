#/bin/bash

ssh-keygen -b 2048 -t rsa -N ""
cat /home/tux/.ssh/id_rsa.pub >> /home/tux/.ssh/authorized_keys

sudo wget -O /usr/local/bin/rke https://github.com/rancher/rke/releases/download/v1.1.9/rke_linux-amd64
sudo chown tux:users /usr/local/bin/rke
sudo chmod +x /usr/local/bin/rke

sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

sudo mv kubectl /usr/local/bin
sudo chown tux:users /usr/local/bin/rke
sudo chmod +x /usr/local/bin/kubectl

echo "rke config --name cluster.yml"
echo "rke up --config cluster.yml"
