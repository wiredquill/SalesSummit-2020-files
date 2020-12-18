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

## Locate IP address of Node-Red

    kubectl get svc -n nodered
    
Example:

```
NAME      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
nodered   LoadBalancer   10.43.233.129   10.0.11.102   80:31063/TCP   8m33s
```

This tells us that Node-Red is now available on 10.0.11.101 on port 80
