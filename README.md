# HAProxy for Kubernetes cluster setup
HAProxy for Kubernetes cluster setup

使用方法：

编辑start-haproxy.sh文件，修改Kubernetes Master节点IP地址为实际Kubernetes集群所使用的值（Master Port如果按标准Breeze安装方法，则6443不用修改）：

例如：
```
#!/bin/bash
MasterIP1=192.168.9.11
MasterIP2=192.168.9.12
MasterIP3=192.168.9.13
MasterPort=6443

docker run -d --restart=always --name HAProxy-K8S -p 6444:6444 -e MasterIP1=$MasterIP1 -e MasterIP2=$MasterIP2 -e MasterIP3=$MasterIP3 -e MasterPort=$MasterPort wise2c/haproxy-k8s
```

在三个节点运行start-haproxy.sh脚本
```
bash start-haproxy.sh
```
