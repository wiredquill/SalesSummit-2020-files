## Installing and Configuring Metal LB

In this lab, we are going to install and configure MetalLB

MetalLB is a load-balancer implementation for bare metal Kubernetes clusters. When configuring a Kubernetes service of type LoadBalancer, MetalLB will dedicate a virtual IP from an address-pool to be used as load balancer for an application.

Prerequisites:
     Raspberry Pi running SLES 15 SP2
     K3s installed


#### Install Metal LB
```
# kubectl apply -f metallb.yaml
```

#### Create Secret for metalLB

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"


#### Create a metallb-config.yml file
Ensure the addresses match the available addresses in your configuration
Edit or create a metallb-config.yaml with the following entries
```
configInline:
  address-pools:
  - name: default
    protocol: layer2
    addresses:
    - 10.0.0.100-10.0.0.109   #This should be a range on 10 IP addresses available on your local Network
```

#### Install MetalLB with Helm
```
# kubectl apply -f metallb-config.yaml
```

watch the pods come up
```
# watch -c "kubectl get po -n metallb-system"
```

Any install using a LoadBalancer will now grab one of these IP Addresses.
