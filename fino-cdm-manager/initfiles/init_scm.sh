#!/bin/bash

#set -e
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && service mysql restart

STA=1
while [[ STA -ne 0 ]]; do
    sleep 5
    mysql -uroot -e "status">> /dev/null 2>&1
    STA=$?
done
echo "started mysql!!!!"

mysql -uroot -e "create database cmf DEFAULT CHARACTER SET utf8;
grant all on cmf.* TO 'cmf'@'%' IDENTIFIED BY 'cmf';
create database metastore DEFAULT CHARACTER SET utf8;
grant all on metastore.* TO 'hive'@'%' IDENTIFIED BY 'hive';
create database hue DEFAULT CHARACTER SET utf8;
grant all on hue.* TO 'hue'@'%' IDENTIFIED BY 'passwrod';
create database rman DEFAULT CHARACTER SET utf8;
grant all on rman.* TO 'rman'@'%' IDENTIFIED BY 'rman';
create database sentry DEFAULT CHARACTER SET utf8;
grant all on sentry.* TO 'sentry'@'%' IDENTIFIED BY 'sentry';
create database nav DEFAULT CHARACTER SET utf8;
grant all on nav.* TO 'nav'@'%' IDENTIFIED BY 'nav';
create database navms DEFAULT CHARACTER SET utf8;
grant all on navms.* TO 'navms'@'%' IDENTIFIED BY 'navms';
create database oozie DEFAULT CHARACTER SET utf8;
grant all on oozie.* TO 'oozie'@'%' IDENTIFIED BY 'oozie'
flush privileges;"

/usr/share/cmf/schema/scm_prepare_database.sh  mysql cmf cmf cmf

# ntp服务器搭建
cat >> /etc/ntp.conf <<EOF
# 中国这边最活跃的时间服务器 : http://www.pool.ntp.org/zone/cn
server 0.cn.pool.ntp.org
server 0.asia.pool.ntp.org
server 3.asia.pool.ntp.org
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

service ntp stop
service cloudera-scm-server stop
service mysql stop

#server fino-cdm-cluster-cdm-manager-1 prefer