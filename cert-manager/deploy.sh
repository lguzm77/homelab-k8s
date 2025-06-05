#!/bin/bash


deploy () {
  # TODO: fill out cluster-issuer.yaml with variables

  kubectl apply -f cluster-issuer.yaml
}



case "$1" in
*)
  deploy
  ;;
esac 
