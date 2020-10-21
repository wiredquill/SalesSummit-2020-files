#/bin/bash

zypper up -y
zypper in -y -t pattern yast2_basis
zypper in -y sudo nmap docker wget iputils vim
systemctl enable --now docker.service
usermod -aG docker tux

echo hostnamectl set-hostname rke-
