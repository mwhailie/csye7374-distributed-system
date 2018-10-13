export NAME=fangn.k8s.tejasparikh.com

export KOPS_STATE_STORE=s3://fangn.k8s.tejasparikh.com

kops delete cluster --name ${NAME} --yes
