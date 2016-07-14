#!/bin/bash
systemctl enable httpd
systemctl restart httpd

ip=`ifconfig eth0 | awk '/inet / {print $2}'`
sed -i "s/127.0.0.1/$ip/g" /root/repoinfo.xml

mkdir -p /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak

function configCentOS7YumRepo() {
cat >> /etc/yum.repos.d/CentOS-7.repo << EOF
[CentOS-7]
name=CentOS-7
baseurl=http://$ip/CentOS-7
enabled=1
gpgcheck=0
EOF
}
configCentOS7YumRepo

function configAmbariYumRepo() {
cat >> /etc/yum.repos.d/ambari.repo << EOF
[Updates-ambari-2.1.2]
name=ambari-2.1.2 - Updates
baseurl=http://$ip/ambari-2.1.2/centos7/2.x/updates/2.1.2
enabled=1
gpgcheck=0
EOF
}
configAmbariYumRepo

function configHDPYumRepo() {
cat >> /etc/yum.repos.d/HDP-2.3.repo << EOF
[HDP-2.3]
name=HDP-2.3
baseurl=http://$ip/HDP-2.3/centos7/2.x/updates/2.3.2.0
enabled=1
gpgcheck=0
EOF
}
configHDPYumRepo

function configHDPUtilsYumRepo() {
cat >> /etc/yum.repos.d/HDP-UTILS-1.1.0.20.repo << EOF
[HDP-UTILS-1.1.0.20]
name=HDP-UTILS-1.1.0.20
baseurl=http://$ip/HDP-UTILS-1.1.0.20/repos/centos7
enabled=1
gpgcheck=0
EOF
}
configHDPUtilsYumRepo

function configMySQLYumRepo() {
cat >> /etc/yum.repos.d/MySQL.repo << EOF
[MySQL]
name=MySQL
baseurl=http://$ip/MySQL
enabled=1
gpgcheck=0
EOF
}

configMySQLYumRepo
