##为了偷懒，将不想手敲的命令写成的脚本。
	由于使用pipework给容器分配ip，故需要先执行_initial-bridge.sh_脚本生成一个虚拟网卡，并将物理网卡挂到该虚拟网卡上。
__ip.txt__存放的是需要分配给server**容器**和client的ip地址，注意该文本文件的ip地址需要是未被占用的ip地址。
hip.txt放的是物理机的ip地址，由于pipework给容器赋予地址后，需要一定生效时间，故采取拿容器来ping宿主机的方式，直至ping通为止。

## 执行(client和master都为容器)
	先执行runclient.sh，根据ip.txt里面分配的ip来依次给容器设置ip地址。
各个宿主机上的client容器都起来之后，再执行runmaster.sh，待master容器启动后，执行setupambariserver.sh对集群进行ssh互信等操作。

## 执行(client为物理机，master为容器)
	将需要进行部署client机器的ip和准备分配给server的ip统统写到ip.txt里
面，各client需要修改hostname用于唯一标识。准备工作完毕之后，执行runmaster.sh启动master容器，待master容器启动后，执行setupambariserver.sh对集群进行ssh互信等操作。

## 友情提示
启动master容器时需要使用pipework工具进行设置ip，以及需要使用docker-spotter工具进行事件监听，以达到容器重启之后将保持ip和hosts和重启之前一样的目的。