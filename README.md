# HandDocker
汇集一个后台程序员需要用到的docker，用于解决后台Cpp/Golang项目快速开发、编译、部署、升级。



### 制作镜像
`make image`

### 将镜像推到dockerhub仓库
`docker push Aren/centos-build:master`

### 更新镜像
`docker pull Aren/centos-build:master`

### 实例化一个容器
`docker run Aren/centos-build:master`

### 
`docker run --entrypoint "" -it Aren/centos-build:master /bin/bash`

