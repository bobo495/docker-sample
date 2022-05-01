kafka部署方法
===

## QuickStart

### 单节点部署

> yml文件中的镜像基于[Dockerfile](./Dockerfile)构建，并已上传至[DockerHub](https://hub.docker.com/repository/docker/per495/kafka)

1. 基于Zookeeper的单节点kafka容器
    ```shell
    # 启动
    docker-compose -f kafka-zk-single.yml up -d
    # 移除
    docker-compose -f kafka-zk-single.yml down
    ```

2. 基于Kraft的单节点kafka容器
    ```shell
    # 启动
    docker-compose -f kafka-kraft-single.yml up -d
    # 移除
    docker-compose -f kafka-kraft-single.yml down
    ```

## Dockerfile说明

基于`ubuntu:20.04`构建包含`kafka binary`文件的镜像，更换了ubuntu源为aliyun，未配置启动命令。

## 参考文档

[kafka doc](https://kafka.apache.org/documentation/#quickstart)
[kafka kraft github](https://github.com/apache/kafka/tree/trunk/config/kraft)