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

render () {
  local PIHOLE_PASSWORD
  echo "Rendering template files"

  read -r -p "Set the pihole web UI password:" PIHOLE_PASSWORD

  sed "s/{ { PIHOLE_PASSWORD } }/$PIHOLE_PASSWORD/g" pihole-stateful-template.yaml > pihole-stateful.yaml
 }


case "$1" in
  render)
  render ;;

  *) 
    deploy;;
esac 
