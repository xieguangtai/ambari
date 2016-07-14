#!/bin/bash
net=none
name=master
imageIP=10.110.18.25:5000
imageName=ambari
imageTag=bigdata
bri=br0

# containers ip
IP='ip.txt'
# hosts ip
HIP='hip.txt'

# check ip not be used
for ip in `cat $IP`; do
	ping -c1 -w1 $ip > /dev/null
	if [ $? -ne 0 ]; then
		# use spotter to monitor docker event
		nohup spotter \
		-e "$name:start,restart:pipework:$bri:-i:eth0:$name:$ip/24" \
		-e "$name:start,restart:docker:exec:$name:cp:-f:/root/hosts:/etc/hosts" \
		-e "$name:stop:echo:$name done" &
		docker run --privileged -td -P -v /opt/data/mysql:/var/lib/mysql --restart=always --name $name -h $name --net $net $imageIP\/$imageName:$imageTag >/dev/null
		echo "Container $name added ip $ip."
		echo "Wait the ip $ip to be effective."
		# let container ping hosts ip to establish connection.
		for hip in `cat $HIP`; do
			while ! docker exec $name ping -c1 -w1 $hip &>/dev/null; do
				sleep 1
			done
			echo "$name ping $hip successful"
		done
		echo "Now the ip $ip is effective."
	else
		continue
	fi
	break
done
