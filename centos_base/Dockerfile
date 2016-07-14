FROM 10.110.18.12:5000/centos:base

RUN rm -f /etc/yum.repos.d/*
ADD self_CentOS.repo /etc/yum.repos.d

RUN yum remove -y fakesystemd
RUN yum install -y systemd openssl

CMD /usr/sbin/init
