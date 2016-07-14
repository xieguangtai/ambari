#!/bin/bash
imageIP=10.110.18.12:5000
imageName=base
imageTag=systemd
name=test

docker run --privileged -tid --name $name $imageIP/$imageName:$imageTag
ID=`docker ps |head -n2|tail -n1| awk '{print $1}'`
docker exec -ti $ID /bin/bash
