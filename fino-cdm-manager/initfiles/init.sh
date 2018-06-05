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
grant all on hue.* TO 'hue'@'%' IDENTIFIED BY 'password';
create database rman DEFAULT CHARACTER SET utf8;
grant all on rman.* TO 'rman'@'%' IDENTIFIED BY 'rman';
create database sentry DEFAULT CHARACTER SET utf8;
grant all on sentry.* TO 'sentry'@'%' IDENTIFIED BY 'sentry';
create database nav DEFAULT CHARACTER SET utf8;
grant all on nav.* TO 'nav'@'%' IDENTIFIED BY 'nav';
create database navms DEFAULT CHARACTER SET utf8;
grant all on navms.* TO 'navms'@'%' IDENTIFIED BY 'navms';
flush privileges;"

service mysql stop
#service cloudera-scm-server restart
#/usr/share/cmf/schema/scm_prepare_database.sh  mysql cmf cmf cmf

#chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && service mysql restart