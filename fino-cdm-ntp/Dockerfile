FROM docker.finogeeks.club/linzhihuang/fino-cdm-envbase:v1.0
MAINTAINER linzhihuang
RUN mkdir -p /opt/cdm/
COPY initfiles/init.sh /opt/cdm/
RUN chmod a+x /opt/cdm/init.sh
expose 123
CMD ["sh","-c","/opt/cdm/init.sh* && bash"]