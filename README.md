# ambari

## centos_raw
基于官方提供的centos压缩包构建原始centos镜像。
官方地址 [centos7](https://hub.docker.com/_/centos/)

本项目是基于[CentOS-7.0.1406](https://github.com/CentOS/sig-cloud-instance-images/blob/CentOS-7.0.1406/docker/Dockerfile)版本构建的

## centos_base
在测试过程中，发现构建ambari-server镜像需要systemd-208-20和openssl-1.0.1e-42版本的包，故需要搭建本地源替换掉上一步构建的centos中的fakesystem包，安装systemd和openssl包。

## centos_tools
基于cento_base镜像添加一些基础包，如sudo, openssh等。

## ambari_client
基于centos_tools构建的ambari_client镜像可以在启动容器时创建密钥并以守护进程运行sshd服务。

##ambari_server
集成了ambari、HDP、HDP-UTILS等rpm安装包于一体的巨无霸镜像，构建完镜像体积达7个多g，构建耗时长，强烈建议采取搭建本地源，将repo文件ADD到镜像的方式来进行构建。

##shell
一些不想手敲而写成脚本的命令集合

##bin
需要用到的一些额外工具
