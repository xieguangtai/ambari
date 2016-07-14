#!/bin/bash
imageIP=10.110.18.12:5000
imageName=ambari
imageTag=client
name=test-client
net=bri1

docker run --restart=always --privileged -tid -P --net $net --name $name -h $name $imageIP/$imageName:$imageTag
if [ $? -eq 0 ]; then
	ID=`docker ps |head -n2|tail -n1| awk '{print $1}'`
	docker exec -ti $ID /bin/bash
fi
