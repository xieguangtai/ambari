# 说明
为了偷懒，将不想手敲的命令写成的脚本。

由于使用 pipework 给容器分配 ip ，故需要先执行 _initial-bridge.sh_ 脚本生成一个虚拟网卡，并将物理网卡挂到该虚拟网卡上。

 _ip.txt_ 存放的是需要分配给 *server* **容器**和 *client* 的 ip 地址，注意该文本文件的 ip 地址需要是未被占用的 ip 地址。

 *hip.txt* 放的是物理机的 ip 地址，由于 pipework 给容器赋予地址后，需要一定生效时间，故采取容器 ping 宿主机的方式，直至 ping 通为止。

# 执行
## client和master都为容器
先执行 _runclient.sh_ ，根据 _ip.txt_ 里面分配的 ip 来依次给容器设置 ip 地址。
各个宿主机上的 client 容器都起来之后，再执行 _runmaster.sh_ ，待 master 容器启动后，执行 _setupambariserver.sh_ 对集群进行 ssh 互信等操作。

## client为物理机，master为容器
将需要进行部署 client 机器的 ip 和准备分配给 server 的 ip 统统写到 _ip.txt_ 里
面，各 client 需要修改 **hostname** 用于唯一标识。准备工作完毕之后，执行 _runmaster.sh_ 启动 master 容器，待 master 容器启动后，执行 _setupambariserver.sh_ 对集群进行 ssh 互信等操作。

# 友情提示
启动 master 容器时需要使用 pipework 工具进行设置 ip ，以及需要使用 docker-spotter 工具进行事件监听，以达到容器重启之后保持 ip 和 hosts 和重启之前一样的目的。