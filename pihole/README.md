# Pihole In Kubernetes

# Architecture

TODO: architecture diagram

# Components

Everything will be deployed in a pihole namesapce

- Config Map for configuration variables. -- DONE
- Secrets for sensitive secrets. -- DONE
- PersistentVolume and PersistentVolumeClaim for dnsmasq and etc data -- DONE
- StatefulSet to deploy read-write Pihole replicas -- DONE
- StatefulSet to deploy read-only Pihole replicas (needed to ensure High Availability).
- A Service to expose pihole within the cluster -- DONE
- A LoadBalancer Service to enable DNS resolution -- IN PROGRESS, will need to install MetalLB
- An Ingress to expose the Pihole UI over HTTPS
