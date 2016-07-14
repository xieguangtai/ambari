FROM 10.110.18.12:5000/centos:tools
MAINTAINER xieguangtai

RUN rm /etc/yum.repos.d/*
ADD repos /etc/yum.repos.d
RUN touch /var/lib/rpm/*

ADD ambari-2.1.2 /var/www/html/ambari-2.1.2 
ADD CentOS-7 /var/www/html/CentOS-7 
ADD HDP-2.3 /var/www/html/HDP-2.3 
ADD HDP-UTILS-1.1.0.20 /var/www/html/HDP-UTILS-1.1.0.20 
ADD MySQL /var/www/html/MySQL 
ADD jdk1.8.0_65 /opt/jdk

ENV JAVA_HOME /opt/jdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN yum install -y httpd mysql-community-server mysql-connector-java ambari-server

ADD mysql_secure.sh /root/mysql_secure.sh
ADD mysql.sh /root/mysql.sh

ADD run.sh /root/run.sh
ADD ssh-key.sh /root/ssh-key.sh
ADD generate_repo.sh /root/generate_repo.sh
ADD ping.sh /root/ping.sh
ADD expectssh.sh /root/expectssh.sh
ADD scp.sh /root/scp.sh
ADD ssh_config /etc/ssh/ssh_config
ADD bak_hosts.sh /root/bak_hosts.sh
ADD ambari_setup_expect.sh /root/ambari_setup_expect.sh
ADD repoinfo.xml /root/repoinfo.xml
ADD java.sh /etc/profile.d/java.sh

RUN chmod +x /root/*.sh
RUN chmod +x -R /opt/jdk/bin

RUN source /etc/profile

EXPOSE 8080

CMD /usr/sbin/init
