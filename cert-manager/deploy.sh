#!/bin/bash


kubectl create secret generic cloudflare-api-token --from-env-file=.env

kubectl apply -f cluster-issuer.yaml
