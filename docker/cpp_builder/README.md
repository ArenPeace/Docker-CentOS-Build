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
