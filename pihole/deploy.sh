#!/bin/bash

deploy () {

kubectl apply -f namespace.yaml

kubectl apply -f headless-service.yaml

kubectl apply -f web-service.yaml

kubectl apply -f dns-service.yaml

# Deploy pods

kubectl apply -f pihole-stateful.yaml
kubectl rollout restart -f pihole-stateful.yaml

# Deploy certificate 

kubectl apply -f pihole-tls-certificate.yaml

# Deploy ingress rules

kubectl apply -f ingress.yaml 

# Orbital sync 

kubectl apply -f orbital-sync-configmap.yaml
kubectl apply -f orbital-sync.yaml

}

case "$1" in
  *) 
    deploy;;
esac 
