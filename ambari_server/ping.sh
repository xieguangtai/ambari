#!/bin/bash
IP=`ifconfig eth0 | awk '/inet / {print $2}'`
echo '-----------Now begian to copy pub to other machines------------'
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
hosts='/tmp/hosts'
IPS='/root/ip.txt'
known_hosts='/root/.ssh/known_hosts'
if [ -f $known_hosts ];then
	rm -rf $known_hosts
fi

# bak hosts
HOSTS='/etc/hosts'
HOSTS_BAK='/etc/hosts.bak'
if [ -e $HOSTS_BAK ]; then
	cp -f $HOSTS_BAK $HOSTS
else
	cp $HOSTS $HOSTS_BAK
fi

# copy id_rsa.pub and generate sshkey on client
for ip in `cat $IPS`;do
	if [ $ip != $IP ];then
		ping -c1 -w1 $ip &>/dev/null
		if [ $? -eq 0 ]; then
			/root/expectssh.sh $ip
			/root/scp.sh $ip
		else
			echo "$ip is not on line, trying next ip address."
		fi
	fi
done

# establish ssh connections and disable strictmode and copy the hostname
for ip in `cat $IPS` ;do
	if [ $ip !=  $IP ] ; then
		ssh root@$ip cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
		scp /etc/ssh/ssh_config root@$ip:/etc/ssh
	fi
	ssh root@$ip cat /etc/hostname > /tmp/hostname
	hostname=`cat /tmp/hostname`
	echo "$ip $hostname.ambari.com $hostname" >> $hosts
done

for ip in `cat $IPS` ;do
	if [ $ip != $IP ];then
		/root/scp.sh $ip
		echo $IP | ssh root@$ip "cat > /tmp/mip"
		echo $ip | ssh root@$ip "cat > /tmp/sip"
		ssh root@$ip -C "/bin/bash" < /root/bak_hosts.sh
	fi
	cat $hosts | ssh root@$ip "cat >> /etc/hosts"
	ssh root@$ip "cp -f /etc/hosts /root/hosts"
done

rm -rf $hosts
#rm -rf $IPS
rm -f /tmp/hostname
