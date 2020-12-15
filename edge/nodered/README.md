## Configuring Node Red with Storage

In this lab, we are going to install Node Red running as a Deployment using the Local Storage Provider for Storage

## Create a hostPath backed persistent volume claim and a pod to utilize it

    kubectl create -f nodered-pv.yaml
    kubectl create -f nodered-pvc.yaml
    kubectl create -f nodered-service.yaml
    kubectl create -f nodered-deployment.yaml


## Access Node Red

    http://[Raspberry Pi IP]:31880/
