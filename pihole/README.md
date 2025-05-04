# Pihole In Kubernetes

# Architecture

TODO: architecture diagram

# Components

Everything will be deployed in a pihole namespace.

- A ConfigMap that reads from a .env object for configuration variables.
- A Secret to hold the UI password. This is created by `deployment.sh` to avoid exposing credentials in this repository.
- A Headless Service to be able to contact the primary pihole pod.
- A Service to expose the web UI (port 80) to the cluster.
- A Service to forward DNS queries (port 53/tcp,udp) to each pihole pod.
- A StatefulSet containing definitions for pihole and metrics exporter and PersistenVolume. (TO BE DONE)
- An Ingress to expose the Pihole UI over HTTPS
