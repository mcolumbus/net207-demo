#!/bin/bash

gcloud alpha compute url-maps import app-payment-next19-url-map \
    --source ./payment-url-map-default.yaml \
    --global

NEG_NAME=$(gcloud beta compute network-endpoint-groups list | grep "paymentdeliveryhost-.*asia-southeast1-b" | awk '{print $1}')
gcloud beta compute backend-services remove-backend app-payment-next19-delivery-backend \
    --network-endpoint-group $NEG_NAME \
    --network-endpoint-group-zone asia-southeast1-b \
    --global \
    --quiet

kubectl config use-context gke_traffic-director-demo_asia-southeast1-b_gke-payment-next19-asia-southeast1-b
kubectl delete deployments app-payment-next19-delivery-asia-southeast1-b

gcloud beta compute network-endpoint-groups delete $NEG_NAME --zone asia-southeast1-b --quiet

NEG_NAME=$(gcloud beta compute network-endpoint-groups list | grep "paymentdeliveryhost-.*us-central1-c" | awk '{print $1}')
gcloud beta compute backend-services remove-backend app-payment-next19-delivery-backend \
    --network-endpoint-group $NEG_NAME \
    --network-endpoint-group-zone us-central1-c \
    --global

kubectl config use-context gke_traffic-director-demo_us-central1-c_gke-payment-next19-us-central1-c
kubectl delete deployments app-payment-next19-delivery-us-central1-c

gcloud beta compute network-endpoint-groups delete $NEG_NAME --zone us-central1-c --quiet
