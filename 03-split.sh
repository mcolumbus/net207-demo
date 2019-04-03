#!/bin/bash

gcloud alpha compute url-maps import app-payment-next19-url-map \
    --source ./payment-url-map-canary.yaml \
    --global