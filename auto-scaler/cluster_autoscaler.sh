CLOUD_PROVIDER=aws
IMAGE=k8s.gcr.io/cluster-autoscaler:v1.2.2
MIN_NODES=1
MAX_NODES=5
AWS_REGION=us-east-1
# For AWS GROUP_NAME should be the name of ASG as seen on AWS console
GROUP_NAME="nodes.k8s.example.com"
SSL_CERT_PATH="/etc/ssl/certs/ca-certificates.crt" # (/etc/ssl/certs for gce, /etc/ssl/certs/ca-bundle.crt for RHEL7.X)

addon=cluster-autoscaler.yml
wget -O ${addon} https://raw.githubusercontent.com/kubernetes/kops/master/addons/cluster-autoscaler/v1.8.0.yaml

sed -i -e "s@{{CLOUD_PROVIDER}}@${CLOUD_PROVIDER}@g" "${addon}"
sed -i -e "s@{{IMAGE}}@${IMAGE}@g" "${addon}"
sed -i -e "s@{{MIN_NODES}}@${MIN_NODES}@g" "${addon}"
sed -i -e "s@{{MAX_NODES}}@${MAX_NODES}@g" "${addon}"
sed -i -e "s@{{GROUP_NAME}}@${GROUP_NAME}@g" "${addon}"
sed -i -e "s@{{AWS_REGION}}@${AWS_REGION}@g" "${addon}"
sed -i -e "s@{{SSL_CERT_PATH}}@${SSL_CERT_PATH}@g" "${addon}"

kubectl apply -f ${addon}

#deploy metrics-server
kubectl apply -f metrics-server.yaml

#deploy Horizontal Pod Autoscaler for app and redis rc
kubectl apply -f pod-autoscaler.yaml

#deploy heapster
kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/standalone/heapster-controller.yaml


