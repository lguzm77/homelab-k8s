#!/bin/bash

# Create secrets from .env file

kubectl create secret generic pihole-secret --from-env-file=.env --namespace=pihole

# Deploy pods

kubectl apply -f pihole.yaml 
