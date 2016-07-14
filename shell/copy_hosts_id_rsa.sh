#!/bin/bash
dir=dir
name=master
ssh=id_rsa
remoteip=10.110.18.22
remotedir='/tmp'

if [ -d $dir ];then
	rm -rf $dir
	mkdir $dir
else
	mkdir $dir
fi

docker cp $name:/root/.ssh/$ssh $dir
docker cp $name:/root/hosts $dir
scp -r $dir $remoteip:$remotedir
