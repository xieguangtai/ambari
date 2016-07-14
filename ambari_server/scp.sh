#!/usr/bin/expect
set timeout 600
set ip [lindex $argv 0]
spawn scp /root/.ssh/authorized_keys root@$ip:/root/.ssh/authorized_keys
expect {
	"yes/no" { send "yes\r"; exp_continue }
    "password:" { send "123456a?\r"; exp_continue }
}
