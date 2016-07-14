基于官方提供的centos压缩包构建原始centos镜像。
官方地址 [centos7](https://hub.docker.com/_/centos/)

本项目是基于[CentOS-7.0.1406](https://github.com/CentOS/sig-cloud-instance-images/blob/CentOS-7.0.1406/docker/Dockerfile)版本构建的

执行构建镜像时，为了偷懒，直接sh buildBaseCentos.sh，注意在脚本中替换imageTag、imageName为你自己的。