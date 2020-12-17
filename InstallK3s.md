## Installing k3s

In this lab, we are going to install and configure k3s on a Raspaberry Pi

### Before we start the lab you need to have <a href="SLESonRPi.md">SLES 15 SP2 installed</a> on your Raspberry Pi.

We will begin this lab as the tux user on your Raspberry Pi

    ssh tux@x.x.x.x

#### Update to the latest patches
```
sudo zypper up
```
#### Install k3s via the automated script

We are using the --write-kubeconfig-mode 644 option so the .kube/config file is automaticly created
```
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
```
The output will look simular to:

```
[INFO]  Finding release for channel stable
[INFO]  Using v1.18.8+k3s1 as release
[INFO]  Downloading hash https://github.com/rancher/k3s/releases/download/v1.18.8+k3s1/sha256sum-arm64.txt
[INFO]  Downloading binary https://github.com/rancher/k3s/releases/download/v1.18.8+k3s1/k3s-arm64
[INFO]  Verifying binary download
[INFO]  Installing k3s to /usr/local/bin/k3s
[INFO]  Creating /usr/local/bin/kubectl symlink to k3s
[INFO]  Creating /usr/local/bin/crictl symlink to k3s
[INFO]  Creating /usr/local/bin/ctr symlink to k3s
[INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
[INFO]  Creating uninstall script /usr/local/bin/k3s-uninstall.sh
[INFO]  env: Creating environment file /etc/systemd/system/k3s.service.env
[INFO]  systemd: Creating service file /etc/systemd/system/k3s.service
[INFO]  systemd: Enabling k3s unit
Created symlink /etc/systemd/system/multi-user.target.wants/k3s.service → /etc/systemd/system/k3s.service.
[INFO]  systemd: Starting k3s
```

#### Test to see if it's working
```
k3s kubectl get nodes
```
Example:

```
NAME        STATUS   ROLES    AGE   VERSION
pi-erin-1   Ready    master   55s   v1.18.9+k3s1
```
## Install bash autocomplete for kubectl

    kubectl completion bash >/etc/bash_completion.d/kubectl
    source ~/.bashrc

## Install Helm3

### Install helm3 client
```
sudo wget -O helm.tar.gz https://get.helm.sh/helm-v3.4.2-linux-arm64.tar.gz
tar -zxvf helm.tar.gz
sudo mv linux-arm64/helm /usr/local/bin
```

### Add Standard Charts
```
helm repo add stable https://charts.helm.sh/stable
helm repo update
```


Done.
