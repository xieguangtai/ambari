#!/bin/bash
systemctl enable mysql
systemctl restart mysql
/root/mysql_secure.sh

HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWD="123456a?"
cat >/tmp/mysql_script<<EOF
USE mysql;
CREATE USER 'ambari'@'%' IDENTIFIED BY 'ambari';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'%';
CREATE USER 'ambari'@'localhost' IDENTIFIED BY 'ambari';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'localhost';
FLUSH PRIVILEGES;
EOF
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWD} < /tmp/mysql_script
USERNAME="ambari"
PASSWD="ambari"
DBNAME="ambari"
cat >/tmp/mysql_script<<EOF
CREATE DATABASE $DBNAME;
EOF
mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWD} < /tmp/mysql_script

rm -f /tmp/mysql_script

mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWD} $DBNAME < /var/lib/ambari-server/resources/Ambari-DDL-MySQL-CREATE.sql
