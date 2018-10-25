# csye7374-fall2018

run the following shell script in the command line to bring up redis server

```
./redis-deployment.sh
```

install [redis-cli](https://redis.io/topics/rediscli) if needed

use command
```
redis-cli -h <host-ip/name> -p 8089 ping 
```
If redis server is up and running, you will get the following response 
```
PONG
```

You can get **<host-ip/name>** using 
```
kubectl get svc
```

 
