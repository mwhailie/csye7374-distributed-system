# csye7374-fall2018

This is a git repo for [CSYE 7374 - Advanced Cloud Computing (Fall 2018)](https://csye7374.tejasparikh.com).

## Team Members

* **Nenghui Fang** , *fangn.k8s.tejasparikh.com* , fang.n@husky.neu.edu
* **Xingyao Wu** , *demo.csye6225-spring2018-wux.me* , wu.x@husky.neu.edu
* **Wenhe Ma** , *demo.csye6225-fall2017-mawenhe.me* , ma.wenhe@husky.neu.edu

## Assignment 3 - Redis on Kubernetes Cluster

### Bring up kubernetes cluster
Run aws-cluster-up.sh to bring up kubernetes cluster on AWS

```
./aws-cluster-up.sh
```
### Access dashboard
Run dashboard.sh and follow instruction to access dashboard

```
./dashboard.sh 
```

### Redis deployment

Run redis-deployment.sh located in redis folder to bring up redis server

```
./redis-deployment.sh
```
Please see assignment4 folder for Redis deployment


### Shut down cluster

Run asw-cluster-down.sh to delete all resources created when you finish 

```
./aws-cluster-down.sh
```

## Assignment 4 - Monitoring

### 1. Setup Prometheus to Collect Metrics

Prometheus deployment
Run prometheus_install.sh located inside prometheus folder to bring up prometheus

```
./prometheus_install.sh
```

2. Run Redis Exporter to Export Metrics



3. Setup Grafana Dashboards to Monitor Metrics

```
kubectl port-forward (kubectl get  pods --selector=app=kube-prometheus-grafana -n  monitoring --output=jsonpath="{.items..metadata.name}") -n monitoring  3000
```
Sign in to grafana with admin/admin.


## Assignment 5 - CI/CD pipeline

1. Code changes are committed to GitHub. Jenkins can monitor GitHub for changes.
2. Clone the repository with latest code and build the container. Container should be tagged with build number. Build number will serve as “version” of your application/container. You may alternatively use date/time for container version number.
3. Push the container to your container registry.
4. Update your app Deployment using “Rolling Update” strategy with zero downtime.

[Jenkinsfile](https://github.com/mwhailie/csye7374-fall2018/blob/master/Jenkinsfile)

## Reference

- [CSYE 7374 - Advanced Cloud Computing (Fall 2018)](https://csye7374.tejasparikh.com)
- [Kubernetes monitoring with Prometheus in 15 minutes](https://itnext.io/kubernetes-monitoring-with-prometheus-in-15-minutes-8e54d1de2e13)
- [Redis Exporter with Grafana dashboard example](https://github.com/oliver006/redis_exporter)
- [Build a Continuous Deployment Pipeline with Jenkins and Kubernetes](https://github.com/GoogleCloudPlatform/continuous-deployment-on-kubernetes)
- [Triggering a Jenkins build from a push to Github](https://medium.com/@marc_best/trigger-a-jenkins-build-from-a-github-push-b922468ef1ae)
