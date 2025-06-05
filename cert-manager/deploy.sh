#!/bin/bash


deploy () {
  prinf "Deploying cert-manager"
  local CLOUDFLARE_EMAIL
  local CLOUDFLARE_API_TOKEN
  read -r -p "Enter your cloudflare account email: "  CLOUDFLARE_EMAIL
  read -r -p "Enter your cloudflare API token: " CLOUDFLARE_API_TOKEN

  sed "s/{ { CLOUDFLARE_EMAIL } }/$CLOUDFLARE_EMAIL/g" cluster-issuer-template.yaml |
    sed "s/{ { CLOUDFLARE_API_TOKEN } }/$CLOUDFLARE_API_TOKEN/g" > cluster-issuer.yaml
  # Before running this command, make sure cluster-issuer.yaml exists 
  kubectl apply -f cluster-issuer.yaml
}



case "$1" in
*)
  deploy
  ;;
esac 
