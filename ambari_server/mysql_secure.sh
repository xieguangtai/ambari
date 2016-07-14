#!/usr/bin/expect
set timeout 600
spawn mysql_secure_installation
expect {
	"Enter current password for root" { send "\r"; exp_continue }
	"Set root password?" { send "Y\r"; exp_continue }
	"New password:" { send "123456a?\r"; exp_continue }
	"Re-enter new password:" { send "123456a?\r"; exp_continue }
	"Remove anonymous users?" { send "Y\r"; exp_continue }
	"Disallow root login remotely?" { send "Y\r"; exp_continue }
	"Remove test database and access to it?" { send "Y\r"; exp_continue }
	"Reload privilege tables now?" { send "Y\r"; exp_continue }
}
