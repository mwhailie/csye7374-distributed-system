
#!/bin/bash
export NAME=demo.csye6225-spring2018-wux.me

export KOPS_STATE_STORE=s3://demo.csye6225-spring2018-wux.me

kops create cluster --zones=us-east-1a --node-count=3 --node-size=t2.micro  --master-count=1  --master-size=t2.micro $NAME

kops update cluster $NAME --yes
