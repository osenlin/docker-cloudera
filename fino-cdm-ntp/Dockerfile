FROM docker.finogeeks.club/linzhihuang/fino-cdm-envbase:v1.0
MAINTAINER linzhihuang
RUN mkdir -p /opt/cdm/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY initfiles/init.sh /opt/cdm/
CMD ["sh","-c","/opt/cdm/init.sh* && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf"]