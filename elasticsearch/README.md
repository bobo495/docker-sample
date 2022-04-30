ES集群部署方法
===

## QuickStart

```shell
# git clone
git clone https://github.com/perayb/docker-sample.git
cd elasticsearch
# 下载官方提供的docker-compose.yml文件，修改源为hub.docker.com，设置管理员密码/es版本
sh getYaml.sh
# 启动集群
docker-compose up -d
```
- kibana地址: [http://localhost:5601/](http://localhost:5601/)
- 登录kibana用户为 `elastic` ，密码为 `esadmin`

## 主要问题解决方法

1. 执行`sh getYaml.sh`时报错hostname `raw.githubusercontent.com`无法解析

```shell
# 添加以下内容到hosts文件中
199.232.68.133 raw.githubusercontent.com
```

2. es节点启动失败，报错：

```log
ERROR: [1] bootstrap checks failed es01 | [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

参考官方文档：[https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-prerequisites](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-prerequisites)
