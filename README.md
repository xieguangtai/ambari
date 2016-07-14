# ambari

## centos_raw
基于官方提供的centos压缩包构建原始centos镜像。
官方地址 [centos7](https://hub.docker.com/_/centos/)

## centos_base
在测试过程中，发现构建ambari-server镜像需要systemd-208-20和openssl-1.0.1e-42版本的包，故需要搭建本地源
替换掉上一步构建的centos中的fakesystem包，安装systemd和openssl包。
