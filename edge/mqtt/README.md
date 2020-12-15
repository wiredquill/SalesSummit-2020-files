## Deploy MQTT for the sensors to talk to Sensors

In this lab we are going to install and configure an MQTT Workload (Mosquitto) to run on k3s cluster

When the Deployment is complete you will have an MQTT service running on port 61883  


## Create a hostPath backed persistent volume claim and a pod to utilize it

    kubectl create -f mosquitto-pv.yaml
    kubectl create -f mosquitto-pvc.yaml
    kubectl create -f mosquitto-service.yaml
    kubectl create -f mosquitto-deployment.yaml


## Test MQTT

MQTT is now exposed on port 61883

Install the Node Red so you can see MQTT traffic
