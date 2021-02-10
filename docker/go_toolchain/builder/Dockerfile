FROM centos-base:master

# Go Setup
RUN echo $'export GOPROXY="https://goproxy.io,direct" \n\
export GOPRIVATE=git.garena.com' > /opt/go113-builder.env
RUN echo source /opt/go113-builder.env >> ~/.bashrc

RUN source ~/.bashrc

# protobuf Setup
COPY protoc.Makefile /build/
RUN ["/bin/bash", "-c", "source ~/.bashrc; make -C /build/ -f protoc.Makefile install clean"]
# 安装go-proto-validators包到`$GOPATH/src`下，用于支持protobuf参数校验
RUN ["/bin/bash", "-c", "source ~/.bashrc; GO111MODULE=off go get github.com/mwitkow/go-proto-validators"]
#  proto-gen
RUN ["/bin/bash", "-c", "source ~/.bashrc; go install google.golang.org/protobuf/cmd/protoc-gen-go"]
RUN ["/bin/bash", "-c", "source ~/.bashrc; go install google.golang.org/grpc/cmd/protoc-gen-go-grpc"]
RUN ["/bin/bash", "-c", "source ~/.bashrc; go install github.com/mwitkow/go-proto-validators/protoc-gen-govalidators"]

WORKDIR /build

ADD pipeline /opt/pipeline

ENTRYPOINT ["/opt/pipeline"]
