# csye7374-fall2018

This is a git repo for CSYE 7374 - Advanced Cloud Computing (Fall 2018).

## Team Members

* **Nenghui Fang** , *fangn.k8s.tejasparikh.com* , fang.n@husky.neu.edu
* **Xingyao Wu** , *demo.csye6225-spring2018-wux.me* , wu.x@husky.neu.edu
* **Wenhe Ma** , *demo.csye6225-fall2017-mawenhe.me* , ma.wenhe@husky.neu.edu

## Assignment 3

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

### Prometheus deployment
Run prometheus_install.sh located inside prometheus folderto bring up prometheus

```
./prometheus_install.sh
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

## Assignment 4 Monitoring

1. Setup Prometheus to Collect Metrics
2. Run Redis Exporter to Export Metrics
3. Setup Grafana Dashboards to Monitor Metrics

## Assignment 5 CI/CD pipeline

1. Code changes are committed to GitHub. Your build system (Jenkins) can either monitor GitHub for changes or it can be configured to be notified by GitHub about new commit.
2. Clone the repository with latest code and build the container. Container should be tagged with build number. Build number will serve as “version” of your application/container. You may alternatively use date/time for container version number.
3. Push the container to your container registry.
4. Update your app Deployment using “Rolling Update” strategy with zero (0) downtime.
