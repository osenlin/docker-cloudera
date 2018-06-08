#image name:docker.finogeeks.club/linzhihuang/fino-cdm-envbase:v1.0
FROM java
MAINTAINER linzhihuang 
RUN apt-get update
RUN apt-get install -y openssh-server supervisor vim host  ntp ntpdate
RUN apt-get install -y dpkg-dev apt-utils apt-mirror 
COPY initfiles/.bashrc ~/
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN mkdir -p /usr/java/jdk1.8 && \
    ln -s /opt/jdk1.8.0_141/* /usr/java/jdk1.8
RUN mv ~/.bashrc ~/.bashrc.bak