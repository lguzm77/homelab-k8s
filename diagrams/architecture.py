from diagrams import Cluster, Diagram
from diagrams.k8s.compute import Pod, StatefulSet
from diagrams.k8s.network import Service
from diagrams.k8s.storage import PV, PVC, StorageClass
from diagrams.k8s.group import Namespace

with Diagram("Pihole On Kubernetes Architecture", show=True):
    with Cluster("Namespace Pihole"):
        sts = StatefulSet("Pihole")
        headless = Service("Headless")

        web_svc = Service("Web Service")
        dns_service_tcp = Service("DNS Service TCP")
        dns_service_udp = Service("DNS Service UDP")

        sts << web_svc
        sts << dns_service_tcp
        sts << dns_service_udp
        

        sts << headless



