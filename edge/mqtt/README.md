## Deploy MQTT for the sensors to talk to Sensors

In this lab we are going to install and configure an MQTT Workload (Mosquitto) to run on k3s cluster

Prerequisites:
     Raspberry Pi running SLES 15 SP2
     K3s installed
     MetalLB installed and configured


## Create a hostPath backed persistent volume claim and a pod to utilize it

    kubectl create -f mosquitto-deployment.yaml
    kubectl create -f mosquitto-service-lb.yaml



## Locate IP address of MQTT

    kubectl get svc -n mqtt

Example:

```
NAME        TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
mosquitto   LoadBalancer   10.43.168.45   10.0.11.101   1883:30155/TCP   19s
```

This tells us that MQTT is now available on 10.0.11.101 on port 1883
