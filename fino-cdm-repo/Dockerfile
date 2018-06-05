########################################################################
# bind local port 24500
#########################################################################
From java
MAINTAINER linzhihuang "linzhihuang@finogeeks.com"
RUN apt-get -y update
RUN apt-get -y install dpkg-dev apt-utils apt-mirror vim supervisor
RUN mkdir -p /data/soft/pool /data/soft/dist
COPY ./debfiles/* /data/soft/pool/contrib/
# ��װ����CDHԴ
WORKDIR /data
RUN dpkg-scanpackages soft/pool | gzip > soft/Packages.gz
RUN apt-get -y install apache2
RUN mkdir /data/soft/cloudera
COPY clouderasources/* /data/soft/cloudera/
WORKDIR /var/www/html 
RUN ln -s /data && mkdir -p /var/log/apache2
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

