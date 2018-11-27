# csye7374-fall2018

This is a git repo for [CSYE 7374 - Advanced Cloud Computing (Fall 2018)](https://csye7374.tejasparikh.com).

## Team Members

* **Nenghui Fang** , *fangn.k8s.tejasparikh.com* , fang.n@husky.neu.edu
* **Xingyao Wu** , *demo.csye6225-spring2018-wux.me* , wu.x@husky.neu.edu
* **Wenhe Ma** , *demo.csye6225-fall2017-mawenhe.me* , ma.wenhe@husky.neu.edu

## Assignment 3 - Redis on Kubernetes Cluster

### Bring up kubernetes cluster
Run [aws-cluster-up.sh](https://github.com/mwhailie/csye7374-fall2018/blob/master/aws-cluster-up.sh) to bring up kubernetes cluster on AWS

```
./aws-cluster-up.sh
```
### Access dashboard
Run [dashboard.sh](https://github.com/mwhailie/csye7374-fall2018/blob/master/dashboard.sh) and follow instruction to access dashboard

```
./dashboard.sh 
```

### Redis deployment

Run [redis-deployment.sh](https://github.com/mwhailie/csye7374-fall2018/blob/master/redis/redis-deployment.sh) located in redis folder to bring up redis server

```
./redis-deployment.sh
```
Please see assignment4 folder for Redis deployment


### Shut down cluster

Run [asw-cluster-down.sh](https://github.com/mwhailie/csye7374-fall2018/blob/master/aws-cluster-down.sh) to delete all resources created when you finish 

```
./aws-cluster-down.sh
```

## Assignment 4 - Monitoring

### Objectives

1. Setup Prometheus to collect metrics
2. Run Redis Exporter in a sidecar along with Redis server and sentinel to export metrics
3. Setup Grafana Dashboards to monitor metrics


### Prometheus deployment

Run [prometheus_install.sh](https://github.com/mwhailie/csye7374-fall2018/blob/master/prometheus_install.sh) located in root folder to bring up prometheus

```
./prometheus_install.sh
```

### Grafana dashboard configuration

Browse to localhost:3000. Sign in to grafana with admin/admin, select data source, and import grafana dashboard.


## Assignment 5 - CI/CD pipeline

### Objectives
1. Code changes are committed to GitHub. Jenkins can monitor GitHub for changes.
2. Clone the repository with latest code and build the container. Container is tagged with build number. Build number will serve as “version” of the application/container.
3. Push the container to the container registry.
4. Update the app Deployment using “Rolling Update” strategy with zero downtime.

### Jenkins configuration:

1. Add web hook and ssh key to git repo
2. Install GitHub integration plugin
3. Add git server(Advance-> convert login and password to credential), test connection
4. Add dockerhub credential
5. Create a new item 
    1. General -> select GitHub project, give project url 
    2. Build Triggers -> GitHub Branches Hooks * * * * * GitHub hook trigger for GITSCM polling
    3. Pipeline -> Pipeline script from SCM. Jenkins will pull [Jenkinsfile](https://github.com/mwhailie/csye7374-fall2018/blob/master/Jenkinsfile) from git repo.

## Reference

- [CSYE 7374 - Advanced Cloud Computing (Fall 2018)](https://csye7374.tejasparikh.com)
- [Reliable, Scalable Redis on Kubernetes](https://github.com/kubernetes/examples/tree/master/staging/storage/redis)
- [Kubernetes monitoring with Prometheus in 15 minutes](https://itnext.io/kubernetes-monitoring-with-prometheus-in-15-minutes-8e54d1de2e13)
- [Redis Exporter with Grafana dashboard example](https://github.com/oliver006/redis_exporter)
- [Build a Continuous Deployment Pipeline with Jenkins and Kubernetes](https://github.com/GoogleCloudPlatform/continuous-deployment-on-kubernetes)
- [Triggering a Jenkins build from a push to Github](https://medium.com/@marc_best/trigger-a-jenkins-build-from-a-github-push-b922468ef1ae)
