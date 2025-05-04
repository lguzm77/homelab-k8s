#!/bin/bash

# Create secrets from .env file

kubectl create secret generic pihole-password --from-env-file=.env --namespace=pihole

kubectl apply -f headless-service.yaml

kubectl apply -f web-service.yaml

kubectl apply -f dns-service.yaml

# Deploy pods

kubectl apply -f pihole-stateful.yaml
