#!/bin/bash

read -p "Input the virtual bridge name: " br0
read -p "Input the name of bridge you use now: " eth0

function manual_config()
{
	#获取eth0的原始IP相关信息配置到网桥br0上
	RET=`nmcli con show $eth0 |grep ipv4.addresses|awk '{print $2}'`
	nmcli con mod $br0 ipv4.addresses $RET
	RET=`nmcli con show $eth0 |grep ipv4.gateway|awk '{print $2}'`
	nmcli con mod $br0 ipv4.gateway $RET
	nmcli con mod $br0 ipv4.method manual

	#eth0的DNS属于可选信息，因此需要判别是否已配置
	RET=`nmcli con show $eth0 |grep "ipv4.dns:"|awk '{print NF}'`
	if [ $RET -eq 2 ] ; then
        	RET=`nmcli con show $eth0 |grep "ipv4.dns:"|awk '{print $2}'`
        	nmcli con mod $br0 ipv4.dns $RET
	fi
}


#添加新的网桥br0和网卡eth0的配置文件
nmcli con add con-name $br0 ifname $br0 type bridge autoconnect yes
nmcli con add ifname $eth0 autoconnect yes type bridge-slave master $br0

#判别网卡eth0是auto还是manual
RET=`nmcli con show $eth0 |grep ipv4.method|awk '{print $2}'`
if [ $RET == "manual" ]; then
	manual_config
fi

#删除旧的配置文件，启用新的配置文件；可用brctl show进行验证
nmcli con delete $eth0;nmcli con up $br0;nmcli con up bridge-slave-$eth0

