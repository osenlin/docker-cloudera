# introduce
���ڹ���cdm����Ҫ��ntp����������

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
����ͨ������ļ��������ntp����˺��ͻ��˵Ĵ
1. ��server�ķ������������ͨ��
    ```yaml
    volumes:
        - /etc/localtime:/etc/localtime:ro 
    ```
    ��docker�ͷ�������ʱ�䱣��һ��  
2. ��server�ķ����ϻ���Ҫ����/etc/ntp.conf����ʽ����shell
    ```shell
    rm /etc/ntp.conf
    cat >> /etc/ntp.conf <<EOF
    # �й�������Ծ��ʱ������� : http://www.pool.ntp.org/zone/cn
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
    # �ⲿʱ�������������ʱ���Ա���ʱ����Ϊʱ�����
    server  127.127.1.0     # local clock
    fudge   127.127.1.0 stratum 10
    EOF
    ```
3. ��client�ķ����϶�/etc/ntp/����ʽ����shell
    ```shell
    echo "server ${NTP_SERVER_HOSTNAME} prefer" >> /etc/ntp.conf
    echo "restrict ${NTP_SERVER_HOSTNAME} " >> /etc/ntp.conf
    ```