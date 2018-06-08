# introduction
这是cloudera manager部署集群的镜像。用于初始化集群的基础环境。

# image build
```shell
docker image build -t fino-cdm-softnode:v2.0
```

# 初始化的环境  
1. ntp
2. ssh
3. superviosr
4. cloudera-manager-daemons
5. cloudera-manager-agent
等服务