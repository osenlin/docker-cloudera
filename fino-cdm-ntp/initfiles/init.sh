#!/bin/bash

#set -e
if [ "$NODE_TYPE" == "server" ]; then
rm /etc/ntp.conf
cat >> /etc/ntp.conf <<EOF
# 中国这边最活跃的时间服务器 : http://www.pool.ntp.org/zone/cn
server 0.ubuntu.pool.ntp.org 
server 1.ubuntu.pool.ntp.org 
server 2.ubuntu.pool.ntp.org 
server 3.ubuntu.pool.ntp.org
# allow update time by the upper server
restrict 0.cn.pool.ntp.org nomodify notrap noquery
restrict 0.asia.pool.ntp.org nomodify notrap noquery
restrict 3.asia.pool.ntp.org nomodify notrap noquery
# Undisciplined Local Clock. This is a fake driver intended for backup
# and when no outside source of synchronized time is available.
# 外部时间服务器不可用时，以本地时间作为时间服务
server  127.127.1.0     # local clock
fudge   127.127.1.0 stratum 10
EOF

else
    echo "server ${NTP_SERVER_HOSTNAME} prefer" >> /etc/ntp.conf
    echo "restrict ${NTP_SERVER_HOSTNAME} " >> /etc/ntp.conf
fi
service ntp restart
