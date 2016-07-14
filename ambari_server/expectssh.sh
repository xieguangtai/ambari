#!/usr/bin/expect
set timeout 600
set ip [lindex $argv 0]
spawn ssh root@$ip -C "/bin/bash" < ssh-key.sh
expect {
	"yes/no" { send "yes\r"; exp_continue }
    "password:" { send "123456a?\r"; exp_continue }
}
