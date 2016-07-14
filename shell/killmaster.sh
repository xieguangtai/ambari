#!/bin/bash
name=master

docker kill $name >/dev/null 2>&1
if [ $? -eq 0 ];then
	echo Killed master
fi
docker rm $name >/dev/null 2>&1
if [ $? -eq 0 ];then
	echo Removed container master
fi
