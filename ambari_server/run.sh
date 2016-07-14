#!/bin/bash
/root/ssh-key.sh
/root/generate_repo.sh
/root/ping.sh
/root/mysql.sh
sleep 3
/root/ambari_setup_expect.sh
mv /root/repoinfo.xml /var/lib/ambari-server/resources/stacks/HDP/2.3/repos
ambari-server start
