# Create a bootstrap master
kubectl create -f redis-master.yaml

# Create a service to track the sentinels
kubectl create -f redis-sentinel-service.yaml

# Create a replication controller for redis servers
# kubectl create -f redis-controller.yaml

# Create a replication controller for redis sentinels
# kubectl create -f redis-sentinel-controller.yaml


