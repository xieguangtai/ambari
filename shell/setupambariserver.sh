#!/bin/bash
# the ambari-server container's name
name=master
# the containers ip
IPS='ip.txt'

docker cp $IPS $name:/root
docker exec $name cat /root/hosts
if [ $? -eq 0 ];then
	docker exec $name sh /root/ping.sh
else
	docker exec $name sh /root/run.sh
fi
