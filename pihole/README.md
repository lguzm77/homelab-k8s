# Pihole In Kubernetes

# Architecture

TODO: architecture diagram

# Components

Everything will be deployed in a pihole namesapce

- Config Map for configuration variables. -- In Progress
- Secrets for sensitive secrets.
- PersistentVolume and PersistentVolumeClaim for dnsmasq and etc data
- StatefulSet to deploy read-write Pihole replicas
- StatefulSet to deploy read-only Pihole replicas (needed to ensure High Availability).
- A Service to expose pihole within the cluster
- A LoadBalancer Service to enable DNS resolution
- An Ingress to expose the Pihole UI over HTTPS
