#!/bin/bash
num=1
cli=c1
clu=idap

for i in `seq 1 $num`; do
	docker kill $cli$clu$i >/dev/null 2>&1
	if [ $? -eq 0 ];then
		echo Killed $cli$clu$i 
	fi
	docker rm $cli$clu$i >/dev/null 2>&1
	if [ $? -eq 0 ];then
		echo Removed container $cli$clu$i
	fi
done
