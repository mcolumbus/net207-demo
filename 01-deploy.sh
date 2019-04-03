#!/bin/bash

kubectl config use-context gke_traffic-director-demo_asia-southeast1-b_gke-payment-next19-asia-southeast1-b
kubectl apply -f ./app-asia-southeast1-b.yaml

kubectl config use-context gke_traffic-director-demo_us-central1-c_gke-payment-next19-us-central1-c
kubectl apply -f ./app-us-central1-c.yaml
