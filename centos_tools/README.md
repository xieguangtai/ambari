构建含有基础包的镜像，安装了sudo,openssh,openssh-clients,openssh-server,iputils
注，iputils为了使ping命令可用，使用时要加--privileged参数。

执行构建镜像时，为了偷懒，直接sh buildCentOSwithTools.sh，注意在脚本中替换imageTag、imageName为你自己的。