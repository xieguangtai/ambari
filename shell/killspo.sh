#!/bin/bash
FILE='spotter.pid'
ps aux | grep spotter |grep -v grep |awk '{print $2}' >> $FILE
for i in `cat $FILE`; do
	kill -9 $i
	if [ $? -eq 0 ]; then
		echo "Killed spotter pid $i"
	fi
done
rm -rf $FILE
