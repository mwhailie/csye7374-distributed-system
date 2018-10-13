# Dashboard setup
kubectl apply -f create-service-account.yaml
kubectl apply -f cluster-role-binding.yaml 

# print out token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

echo -e "\n\nCopy Token above, Access Dashboard at: http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/\n\n"

# Deploy dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl proxy


