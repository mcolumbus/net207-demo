#!/bin/bash

NEG_NAME=$(gcloud beta compute network-endpoint-groups list | grep "paymentdeliveryhost-.*asia-southeast1-b" | awk '{print $1}')

gcloud beta compute backend-services add-backend app-payment-next19-delivery-backend \
    --network-endpoint-group $NEG_NAME \
    --network-endpoint-group-zone asia-southeast1-b \
    --balancing-mode RATE \
    --max-rate-per-endpoint 5 \
    --global

NEG_NAME=$(gcloud beta compute network-endpoint-groups list | grep "paymentdeliveryhost-.*us-central1-c" | awk '{print $1}')

gcloud beta compute backend-services add-backend app-payment-next19-delivery-backend \
    --network-endpoint-group $NEG_NAME \
    --network-endpoint-group-zone us-central1-c \
    --balancing-mode RATE \
    --max-rate-per-endpoint 5 \
    --global