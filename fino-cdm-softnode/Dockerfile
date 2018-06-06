FROM docker.finogeeks.club/linzhihuang/fino-cdm-envbase:v1.0
MAINTAINER linzhihuang "linzhihuang@finogeeks.com"
ADD initfiles/apt.conf /etc/apt/
# 填入fino-cdm-repo的宿主机host
RUN echo "deb http://192.168.10.82:24500/data /soft/" >>/etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y lsb-base psmisc bash libsasl2-modules 
RUN apt-get install -y zlib1g libsqlite3-0 libfuse2 fuse rpcbind libxslt1.1 
RUN apt-get install -y libsasl2-modules-gssapi-mit libmysql-java python-urllib3 
RUN apt-get install -y python-mysqldb mysql-client libmysqlclient-dev
RUN apt-get install -y cloudera-manager-daemons cloudera-manager-agent
COPY initfiles/init_start.sh /opt/
RUN chmod a+x /opt/init_start.sh
WORKDIR /opt
EXPOSE 22  9000 9001 7182
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["sh", "-c", "/opt/init_start.sh* && bash"]
