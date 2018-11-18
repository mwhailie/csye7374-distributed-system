#!/bin/bash

kubectl apply -f ./jenkins/jenkins-default-service-account.yaml 

helm install -n cd stable/jenkins -f jenkins/values.yaml --version 0.16.6 --wait


export JENKINS_URL=$(kubectl get svc cd-jenkins -o=jsonpath='{.status.loadBalancer.ingress[0].hostname}')":8080"

echo -e "\n\npassword: $(kubectl get secret --namespace default cd-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode) \n"

echo -e "\nAccess Jenkins Dashboard at:\n\n$JENKINS_URL \n\nWith admin/password above\n"


