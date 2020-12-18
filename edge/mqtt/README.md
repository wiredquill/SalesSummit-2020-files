## Deploy MQTT for the sensors to talk to Sensors

In this lab we are going to install and configure an MQTT Workload (Mosquitto) to run on k3s cluster

Prerequisites:
     Raspberry Pi running SLES 15 SP2
     K3s installed
     MetalLB installed and configured


## Create a hostPath backed persistent volume claim and a pod to utilize it

    kubectl create -f mosquitto-service.yaml
    kubectl create -f mosquitto-deployment.yaml


## Locate IP address of MQTT

    kubectl get svc -n mqtt
