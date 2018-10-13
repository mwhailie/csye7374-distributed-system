#aws s3api create-bucket --bucket fangn.k8s.tejasparikh.com  --region us-east-1

#aws s3api put-bucket-versioning --bucket fangn.k8s.tejasparikh.com  --versioning-configuration Status=Enabled

export NAME=fangn.k8s.tejasparikh.com

export KOPS_STATE_STORE=s3://fangn.k8s.tejasparikh.com

kops create cluster --zones=us-east-1a --node-count=3 --node-size=t2.micro  --master-count=1  --master-size=t2.micro $NAME

kops update cluster $NAME --yes
