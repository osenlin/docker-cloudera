FROM java
MAINTAINER linzhihuang "linzhihuang@finogeeks.com"
ADD initfiles/apt.conf /etc/apt/
RUN echo "deb http://192.168.10.82:24500/data /soft/" >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server supervisor
RUN apt-get install -y lsb-base psmisc bash libsasl2-modules 
RUN apt-get install -y zlib1g libsqlite3-0 libfuse2 fuse rpcbind libxslt1.1 
RUN apt-get install -y libsasl2-modules-gssapi-mit libmysql-java python-urllib3 
RUN apt-get install -y python-mysqldb 
RUN apt-get install -y cloudera-manager-daemons 
RUN apt-get install -y cloudera-manager-agent
RUN apt-get install -y host vim
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN mkdir -p /usr/java/jdk1.8 && \
    ln -s /opt/jdk1.8.0_141/* /usr/java/jdk1.8
RUN mv ~/.bashrc ~/.bashrc.bak
COPY initfiles/.bashrc ~/
COPY initfiles/init_start.sh /opt/
RUN chmod a+x /opt/init_start.sh
RUN apt-get install -y ntp ntpdate
WORKDIR /opt
EXPOSE 22  9000 9001 7182
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["sh", "-c", "/opt/init_start.sh* && bash"]
