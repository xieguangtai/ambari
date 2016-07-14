#!/bin/bash
HOSTS='/etc/hosts'
HOSTS_BAK='/etc/hosts.bak'
if [ -e $HOSTS_BAK ]; then
	cp -f $HOSTS_BAK $HOSTS
else
	cp $HOSTS $HOSTS_BAK
fi

# delete known_hosts
known_hosts='/root/.ssh/known_hosts'
if [ -f $known_hosts ];then
	rm -rf $known_hosts
fi

MIP=`cat /tmp/mip`
SIP=`cat /tmp/sip`

# if not have jdk, copy from master
if [ ! -d /opt/jdk ];then
	 scp -r $MIP:/opt/jdk $SIP:/opt
fi

touch /opt/betweenjdkandjava

if [ ! -e /etc/profile.d/java.sh ];then
	scp $MIP:/etc/profile.d/java.sh /etc/profile.d
fi

path='/etc/yum.repos.d'
mkdir -p $path/bak
mv $path/*.repo  $path/bak
scp $MIP:$path/*.repo $SIP:$path
