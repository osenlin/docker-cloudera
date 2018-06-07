# introduce
用于构建cdm所需要的ntp服务器镜像

# image build
```shell
docker image build -t docker.finogeeks.club/linzhihuang/fino-cdm-ntp:v2.0
```

# run
```shell
docker run   --rm -it docker.finogeeks.club/linzhihuang/fino-cdm-ntp:v2.0
```

# run cluster
```shell
docker compose up
```  
## config  
我们通过下面的几步来完成ntp服务端和客户端的搭建
1. 在server的服务机器上我们通过
    ```yaml
    volumes:
        - /etc/localtime:/etc/localtime:ro 
    ```
    让docker和服务器的时间保持一致  
2. 在server的服务上还需要配置/etc/ntp.conf，方式如下shell
    ```shell
    rm /etc/ntp.conf
    cat >> /etc/ntp.conf <<EOF
    # 中国这边最活跃的时间服务器 : http://www.pool.ntp.org/zone/cn
    server 0.ubuntu.pool.ntp.org 
    server 1.ubuntu.pool.ntp.org 
    server 2.ubuntu.pool.ntp.org 
    server 3.ubuntu.pool.ntp.org
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
    ```
3. 在client的服务上对/etc/ntp/。方式如下shell
    ```shell
    echo "server ${NTP_SERVER_HOSTNAME} prefer" >> /etc/ntp.conf
    echo "restrict ${NTP_SERVER_HOSTNAME} " >> /etc/ntp.conf
    ```