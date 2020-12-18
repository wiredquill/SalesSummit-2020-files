## Configuring Node Red with Storage

In this lab, we are going to install Node Red running as a Deployment using the Local Storage Provider for Storage

Prerequisites:
     Raspberry Pi running SLES 15 SP2
     K3s installed
     MetalLB installed and configured


## Create a hostPath backed persistent volume claim and a pod to utilize it


    kubectl create -f nodered-storage.yaml
    kubectl create -f nodered-service-lb.yaml
    kubectl create -f nodered-deployment.yaml


## Access Node Red

    http://[Raspberry Pi IP]:31880/
