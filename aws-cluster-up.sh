
#!/bin/bash
export NAME=$1

export KOPS_STATE_STORE=s3://$1

kops create cluster --zones=us-east-1a --node-count=3 --node-size=t2.micro  --master-count=1  --master-size=t2.micro $NAME

kops update cluster $NAME --yes
