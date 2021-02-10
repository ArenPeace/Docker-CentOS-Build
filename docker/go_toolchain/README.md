# go toolchain

## protoc
protoc 命令来自 https://github.com/google/protobuf（已被google.golang.org/protobuf替代），用于生成序列化和反序列化的代码，无go相关代码。

protoc-gen-go插件 来自于https://github.com/golang/protobuf/protoc-gen-go， 可以产生go相关代码， 除上述序列化和反序列化代码之外， 还增加了一些通信公共库。

grpc 来自于https://github.com/grpc/grpc-go, protoc和protoc-gen-go这两个工具都不在其中，所以玩grpc的时候，少不了protoc和protoc-gen-go.

编译方法分别为：
```shell
protoc --go_out=./go1/ ./proto/my.proto  
protoc --go_out=plugins=grpc:./go2/  ./proto/my.proto
```

## trouble


## 引用
https://developers.google.com/protocol-buffers/docs/gotutorial
https://github.com/golang/protobuf/releases#v1.4-generated-code
https://pkg.go.dev/github.com/golang/protobuf