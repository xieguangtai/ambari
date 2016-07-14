#!/usr/bin/expect
set timeout 10

spawn ambari-server setup
expect {
  "Customize user account*" { send "\n"; exp_continue }
  "Enter choice*" { send "3\r"; exp_continue }
  "Path to JAVA_HOME:" { send "/opt/jdk\r"; exp_continue }
  "Enter advanced database configuration*" { send "y\r"; exp_continue }
  "Enter choice (1):" { send "3\r"; exp_continue }
  "Hostname (localhost):" { send "\n"; exp_continue }
  "Port (3306):" { send "\n"; exp_continue }
  "Database name (ambari):" { send "\n"; exp_continue }
  "Username (ambari):" { send "\n"; exp_continue }
  "Enter Database Password (bigdata):" { send "ambari\r"; exp_continue }
  "Re-enter password:" { send "ambari\r"; exp_continue }
  "Proceed with configuring remote database*" { send "\n"; exp_continue }
}
