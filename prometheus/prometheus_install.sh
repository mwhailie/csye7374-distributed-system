#!/bin/bash

kubectl apply -f helm-service-account.yaml
kubectl apply -f namespace.yaml
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/
sleep 20
helm install coreos/prometheus-operator --name prometheus-koperator --namespace monitoring
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbakcEnable=true --namespace monitoring
# kubectl port-forward -n monitoring prometheus-kube-prometheus-0 9090
# kubectl port-forward $(kubectl get  pods --selector=app=kube-prometheus-grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000
