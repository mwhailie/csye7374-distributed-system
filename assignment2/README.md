# csye7374-fall2018
run 
```
./redis-deployment.sh
```

in the command line to bring up redis server

install redis-cli if needed

use command
```
redis-cli -h <host-ip/name> -p 8089 ping 
```
If redis server is up and running, you will get the following response 
```
PONG
```

You can get <host-ip/name> using 
```
kubectl get svc
```

 
