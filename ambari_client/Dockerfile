# get jdk java.sh ssh_config repos from master and genetare id_rsa from master
FROM 10.110.18.12:5000/centos:tools
MAINTAINER xieguangtai

ADD ssh-key.sh /root/ssh-key.sh

RUN chmod +x /root/*.sh

CMD /root/ssh-key.sh && /usr/sbin/sshd -D 
