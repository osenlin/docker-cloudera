# cloudera manager 本地源的构建
如果在线安装cdm，由于网络速度问题会导致安装事件很长，故用此构建CDM5.14.0的私有源，来大大减缓安装的事件

# build image
```shell
docker image build -t docker.finogeeks.club/linzhihuang/fino-cdm-repo:v2.0
```
# 需要做的事情
1. 从cloudera的官网下载安装包  
    - CDH-5.14.0-1.cdh5.14.0.p0.24-xenial.parcel
    - CDH-5.14.0-1.cdh5.14.0.p0.24-xenial.parcel.sha1
    - manifest.json  

    将上面的三个文件下载完后放到clouderasources目录下
2. 从cloudera提供的apt源下载deb文件
    - cloudera-manager-agent_5.14.0-1.cm5140.p0.25~xenial-cm5_amd64.deb
    - cloudera-manager-daemons_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb
    - cloudera-manager-server_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb
    - cloudera-manager-server-db_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb
    - cloudera-manager-server-db-2_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb

    将上面的五个文件下载完后放到debfiles目录下
# 需要做的事情
1. 开放24500的端口，映射到容器80端口