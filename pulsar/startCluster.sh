#!/bin/bash

# 初始化挂载数据目录
rm -rf data
mkdir -p data/{zk1,zk2,zk3}
mkdir -p data/{bookie1,bookie2,bookie3}
mkdir -p data/{broker1,broker2,broker3}

# 启动服务
docker compose -f docker-compose-cluster.yml up -d
