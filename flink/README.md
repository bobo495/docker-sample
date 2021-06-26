基于Docker的Flink集群部署和作业提交方法
===

## 准备工作

1. 安装最新版本的[docker](https://www.docker.com/community-edition)
2. 拉取[flink](https://hub.docker.com/r/apachepulsar/pulsar)

``` linux
docker pull flink:scala_2.11-java8
```

## 部署流程
 
包含三个版本Flink集群部署方法

1. [Flink集群部署](#flink集群部署)
    > 对应文件为docker-compose-cluster.yml，常规Flink集群

2. [挂载lib目录部署](#挂载lib目录部署)
   > 挂载flink客户端的lib目录，便于添加第三方依赖包

3. [Flink-Monitor集群部署]
    > 配置Flink集群的[Metrics](https://ci.apache.org/projects/flink/flink-docs-release-1.13/docs/ops/metrics/)转发至[Prometheus](https://prometheus.io/)，并通过[Grafana](https://grafana.com/)展示Metrics数据
]
自定义Flink作业提交到集群方法参考[提交自定义flink作业](#提交自定义flink作业)

### Flink集群部署

启动Flink集群
``` linux
docker compose -f docker-compose-cluster.yml up -d
```

移除Flink集群
``` linux
docker compose -f docker-compose-cluster.yml down
```

等待Flink集群启动完成后，打开`Flink Web`页面
    - http://localhost:8081/#/overview

`Flink Web`页面打开后，能看到两个taskmanager说明集群部署完成

![](images/2021-06-26-11-22-39.png)

修改集群taskmanager数量
``` linux
docker-compose -f docker-compose-cluster.yml scale taskmanager=<N>
``` 

停止和启动集群(保留容器):
``` shell
# 停止容器
docker compose -f docker-compose-cluster.yml stop
# 启动容器
docker compose -f docker-compose-cluster.yml start
```

#### 容器entrypoint说明
为保证`Flink Web`页面可以看到STDOUT日志，因此修改entrypoint为如下启动方式，修改原理参考- [Flink Web UI不显示STDOUT问题](https://stackoverflow.com/questions/54036010/apache-flink-the-file-stdout-is-not-available-on-the-taskexecutor)

``` yml
    entrypoint: 
      - sh 
      - -c  
      - |
        sed -i 's/start-foreground/start/g' /docker-entrypoint.sh
        /docker-entrypoint.sh jobmanager
        sleep 10 && tail -f -n +0 /opt/flink/log/*
```

### 挂载lib目录部署
> 运行Flink作业时，如果涉及第三方jar包，则需要引入至Flink客户端，因此补充挂在flink lib目录的部署方式。

获取已有lib目录文件
``` shell
# 创建挂载目录
mkdir ./volumes
# 启动Flink集群
docker compose -f docker-compose-cluster.yml up -d
# 获取lib目录文件
docker cp flink_jobmanager_1:/opt/flink/lib jobmanager/lib
#  移除Flink集群
docker compose -f docker-compose-cluster.yml down
```

启动挂载lib的Flink集群
``` linux
docker compose -f docker-compose-cluster-with-volumes.yml up -d
```

移除集群
``` linux
docker compose -f docker-compose-cluster-with-volumes.yml down
```

`Flink Web`页面
    - http://localhost:8081/#/overview

停止和启动集群(保留容器):
``` shell
# 停止容器
docker compose -f docker-compose-cluster-with-volumes.yml stop
# 启动容器
docker compose -f docker-compose-cluster-with-volumes.yml start
```

### Flink-Monitor集群部署

// TODO

## 提交自定义Flink作业

1. 登录[Flink Web](http://localhost:8081/#/overview)页面
2. 点击`Submit New Job` -> `Add New` 添加jar包
3. 以`flink-examples-1.0-SNAPSHOT.jar`为例：点击`jar`包名称 -> 配置`EntryClass`为`pers.yibo.flink.streaming.demo.hello.HelloFlink` -> 点击`submit`则可提交并运行作业

**如下所示说明作业正确运行**

作业详情显示为`running`

![](images/2021-06-26-17-06-55.png)

点击作业对应的`taskmanager` -> 点击`stdout`可看到输出数据

![](images/2021-06-26-17-07-49.png)

## 参考资料

- [Flink Docker文档](https://ci.apache.org/projects/flink/flink-docs-master/zh/docs/deployment/resource-providers/standalone/docker/)
- [Flink Web UI不显示STDOUT问题](https://stackoverflow.com/questions/54036010/apache-flink-the-file-stdout-is-not-available-on-the-taskexecutor)
- [Flink Metrics文档](https://ci.apache.org/projects/flink/flink-docs-release-1.13/docs/ops/metrics/)
- [Prometheus Docker文档](https://prometheus.io/docs/prometheus/latest/installation/)
- [Grafana Docker文档](https://grafana.com/docs/grafana/latest/installation/docker/)
