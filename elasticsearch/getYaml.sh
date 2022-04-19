#!/bin/bash

# 从官方github下载docker示例文件
# https://github.com/elastic/elasticsearch/blob/master/docs/reference/setup/install/docker

# 提示无法解析hosts时，添加以下内容到hosts文件中
# 199.232.68.133 raw.githubusercontent.com

# docker-compose文件
curl -o docker-compose.yml https://raw.githubusercontent.com/elastic/elasticsearch/master/docs/reference/setup/install/docker/docker-compose.yml
# 下载环境配置
curl -o .env https://raw.githubusercontent.com/elastic/elasticsearch/master/docs/reference/setup/install/docker/.env

# 修改docker-compose.yml的image地址
sed -i 's|docker.elastic.co/elasticsearch/||g' docker-compose.yml

# 设置es密码为esadmin
sed -i 's/^ELASTIC_PASSWORD=.*$/ELASTIC_PASSWORD=esadmin/g' .env
# 设置kibana管理员密码
sed -i 's/^KIBANA_PASSWORD=.*$/KIBANA_PASSWORD=esadmin/g' .env
# 设置es版本号为8.1.2
sed -i 's/^STACK_VERSION=.*$/STACK_VERSION=8.1.2/g' .env