# cloudera manager ����Դ�Ĺ���
������߰�װcdm�����������ٶ�����ᵼ�°�װ�¼��ܳ������ô˹���CDM5.14.0��˽��Դ������������װ���¼�

# build image
```shell
docker image build -t docker.finogeeks.club/linzhihuang/fino-cdm-repo:v2.0
```
# ��Ҫ��������
1. ��cloudera�Ĺ������ذ�װ��  
    - CDH-5.14.0-1.cdh5.14.0.p0.24-xenial.parcel
    - CDH-5.14.0-1.cdh5.14.0.p0.24-xenial.parcel.sha1
    - manifest.json  

    ������������ļ��������ŵ�clouderasourcesĿ¼��
2. ��cloudera�ṩ��aptԴ����deb�ļ�
    - cloudera-manager-agent_5.14.0-1.cm5140.p0.25~xenial-cm5_amd64.deb
    - cloudera-manager-daemons_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb
    - cloudera-manager-server_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb
    - cloudera-manager-server-db_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb
    - cloudera-manager-server-db-2_5.14.0-1.cm5140.p0.25~xenial-cm5_all.deb

    �����������ļ��������ŵ�debfilesĿ¼��
# ��Ҫ��������
1. ����24500�Ķ˿ڣ�ӳ�䵽����80�˿�