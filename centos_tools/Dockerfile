FROM 10.110.18.12:5000/centos:system

RUN rm -f /etc/yum.repos.d/*
ADD repos /etc/yum.repos.d
RUN touch /var/lib/rpm/*
RUN yum install -y net-tools expect sudo openssh openssh-server openssh-clients iputils

CMD /usr/sbin/init
