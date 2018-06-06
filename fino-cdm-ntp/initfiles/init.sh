#!/bin/bash

#set -e
service ntp start
# ntp�������
if [ "$NODE_TYPE" == "server" ]; then
cat >> /etc/ntp.conf <<EOF
# �й�������Ծ��ʱ������� : http://www.pool.ntp.org/zone/cn
server 0.cn.pool.ntp.org
server 0.asia.pool.ntp.org
server 3.asia.pool.ntp.org
# allow update time by the upper server
restrict 0.cn.pool.ntp.org nomodify notrap noquery
restrict 0.asia.pool.ntp.org nomodify notrap noquery
restrict 3.asia.pool.ntp.org nomodify notrap noquery
# Undisciplined Local Clock. This is a fake driver intended for backup
# and when no outside source of synchronized time is available.
# �ⲿʱ�������������ʱ���Ա���ʱ����Ϊʱ�����
server  127.127.1.0     # local clock
fudge   127.127.1.0 stratum 10
EOF

else
    echo "server ${NTP_SERVER_HOSTNAME} prefer" >> /etc/ntp.conf
fi

service ntp stop

