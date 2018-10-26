#!/bin/bash

if [[ $# -eq 0 ]] ; then
    PS3='Please choose your domain to create a cluster: '
	options=("fangn.k8s.tejasparikh.com" "demo.csye6225-spring2018-wux.me" "demo.csye6225-fall2017-mawenhe.me")
	select opt in "${options[@]}"
	do
	    case $opt in
	        "fangn.k8s.tejasparikh.com")
	            echo "hello, nenghui"
	            export NAME=fangn.k8s.tejasparikh.com
	            break
	            ;;
	        "demo.csye6225-spring2018-wux.me")
	            echo "hello, xingyao"
	            export NAME=demo.csye6225-spring2018-wux.me
	            break
	            ;;
	        "demo.csye6225-fall2017-mawenhe.me")
	            echo "hello, wenhe"
	            export NAME=demo.csye6225-fall2017-mawenhe.me
	            break
	            ;;
	        *) echo "invalid option $REPLY";;
	    esac
	done
else
    export NAME=$1
fi

export KOPS_STATE_STORE=s3://$NAME

kops create cluster --zones=us-east-1a --node-count=3 --node-size=t2.micro  --master-count=1  --master-size=t2.micro $NAME

kops update cluster $NAME --yes
