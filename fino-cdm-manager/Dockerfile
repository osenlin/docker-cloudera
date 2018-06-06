FROM docker.finogeeks.club/linzhihuang/fino-cdm-softnode:v2.0
MAINTAINER linzhihuang "linzhihuang@finogeeks.com"
RUN apt-get install -y cloudera-manager-server
RUN echo root:root |chpasswd
RUN DEBIAN_FRONTEND=noninteractive apt install -y mysql-server=5.7.22-0ubuntu0.16.04.1
RUN mv /var/lib/mysql/ib_logfile* /tmp/  && rm -f /etc/mysql/my.cnf && \
    mkdir -p /var/run/mysqld /opt/cdm 
RUN usermod -d /var/lib/mysql/ mysql 
ADD initfiles/my.cnf /etc/mysql/
COPY initfiles/init_scm.sh /opt/cdm/init_scm.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod a+x /opt/cdm/init_scm.sh
EXPOSE 3306 7180 7182 9000 9001 10101
WORKDIR /opt/cdm/
CMD ["sh","-c","/opt/cdm/init_scm.sh* && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf"]