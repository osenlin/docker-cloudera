# introduction
这个cloudera manager镜像，通过本镜像可以启动cloudera manager的web管理界面

# image build
```shell
docker image build -t docker.finogeeks.club/linzhihuang/fino-cdm-mananger:v2.0
```

# use
web地址: http://host:7180

# mind
1. 必须对外开放7180，7182，9000，9001端口
