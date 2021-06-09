基于Docker的pulsar集群部署方法
===

## 准备工作

1. 安装最新版本的[docker](https://www.docker.com/community-edition)
2. 拉取[pulsar](https://hub.docker.com/r/apachepulsar/pulsar)和[pulsar-manager](https://hub.docker.com/r/apachepulsar/pulsar-manager)镜像

``` linux
docker pull apachepulsar/pulsar:2.7.2
docker pull apachepulsar/pulsar-manager:v0.2.0
```

## 部署流程

### standalone方式部署



### cluster方式部署

## 参考资料

- [在 Docker 里配置单机 Pulsar](https://pulsar.apache.org/docs/zh-CN/next/standalone-docker/)
- [pulsar集群元数据管理](https://pulsar.apache.org/docs/zh-CN/next/admin-api-clusters/)
- [github: pulsar-manager](https://github.com/apache/pulsar-manager)
