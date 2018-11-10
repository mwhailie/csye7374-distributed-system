# csye7374-fall2018

This is a git repo for CSYE 7374 - Advanced Cloud Computing (Fall 2018).

## Team Members

* **Nenghui Fang** , *fangn.k8s.tejasparikh.com* , fang.n@husky.neu.edu
* **Xingyao Wu** , *demo.csye6225-spring2018-wux.me* , wu.x@husky.neu.edu
* **Wenhe Ma** , *demo.csye6225-fall2017-mawenhe.me* , ma.wenhe@husky.neu.edu

## Assignment 4

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


### Shut down cluster

Run asw-cluster-down.sh to delete all resources created when you finish 

```
./aws-cluster-down.sh
```
