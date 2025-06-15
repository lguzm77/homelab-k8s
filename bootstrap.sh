#! /usr/bin/bash


bootstrap () {

  echo "Bootstrapping k3s cluster"

  echo "Bootstrapping cert-manager"
  sh ./cert-manager/deploy.sh install
  sh ./cert-manager/deploy.sh render

  echo "Deploying cert-manager"
  sh ./cert-manager/deploy.sh

  echo "Boostrapping pihole"
  sh ./pihole/deploy.sh render
  
  echo "Deploying pihole"
  sh ./pihole/deploy.sh

}



case "$!" in

  *) bootstrap ;;
esac 
