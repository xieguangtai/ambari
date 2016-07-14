#!/bin/bash
defSSH(){
ssh-keygen -t rsa -N ''<<EOF

EOF
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''<<EOF

EOF
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''<<EOF

EOF
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''<<EOF

EOF
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''<<EOF

EOF
touch /root/.ssh/authorized_keys
}
defPasswd(){
	echo root:123456a? | chpasswd
}

del_self_ip_in_hosts(){
	name=`cat /etc/hostname`
	cp /etc/hosts /tmp/hosts
	sed -i "/$name/d" /tmp/hosts
	cp /tmp/hosts /etc/hosts
	rm -f /tmp/hosts
}

del_self_ip_in_hosts
defSSH
defPasswd
