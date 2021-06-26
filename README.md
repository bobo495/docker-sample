# Docker Sample

## 说明
本项目提供常用的组件/工具使用`Docker`或`docker compose`的部署方法，便于更快的学习使用相关组件/工具。

## 已完成组件

### [pulsar](./pulsar)

> 相关链接：[pulsar官网](https://pulsar.apache.org), [pulsar官方文档](https://pulsar.apache.org/docs/zh-CN/standalone/)

- 支持单节点模式部署
- 支持集群模式部署

### [flink](./flink)

> 相关链接：[flink官方文档](https://flink.apache.org/)

**包含三个版本Flink集群部署方法**

1. Flink集群部署
    > 常规Flink集群

2. 挂载lib目录部署
   > 挂载flink客户端的lib目录，便于添加第三方依赖包

3. Flink-Monitor集群部署
    > 配置Flink集群的[Metrics](https://ci.apache.org/projects/flink/flink-docs-release-1.13/docs/ops/metrics/)转发至[Prometheus](https://prometheus.io/)，并通过[Grafana](https://grafana.com/)展示Metrics数据