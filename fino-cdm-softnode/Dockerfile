FROM fino-cdm-envbase:v2.0
MAINTAINER linzhihuang "linzhihuang"
ADD initfiles/apt.conf /etc/apt/
# ����fino-cdm-repo��������host
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
CMD ["sh", "-c", "/opt/init_start.sh* && bash"]
