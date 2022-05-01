FROM ubuntu:20.04

ENV kafka_version=3.1.0
ENV scala_version=2.13

LABEL author="bobo"
LABEL version="kafka_${scala_version}-${kafka_version}"

# change ubuntu mirror 
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get -qq update

# change timezone
RUN apt-get install -y tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" >> /etc/timezone

# install wget & jdk 
RUN apt-get install -y wget openjdk-8-jdk

# download kafka binary
WORKDIR /opt
RUN wget https://dlcdn.apache.org/kafka/${kafka_version}/kafka_${scala_version}-${kafka_version}.tgz \
    && tar -xzf kafka_${scala_version}-${kafka_version}.tgz \
    && rm kafka_${scala_version}-${kafka_version}.tgz

WORKDIR /opt/kafka_${scala_version}-${kafka_version}
