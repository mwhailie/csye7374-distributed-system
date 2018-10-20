export NAME=demo.csye6225-spring2018-wux.me

export KOPS_STATE_STORE=s3://demo.csye6225-spring2018-wux.me

kops delete cluster --name ${NAME} --yes
