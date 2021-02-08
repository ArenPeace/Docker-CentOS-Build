FROM centos:7
    
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
#RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
#RUN yum install -y locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
#RUN localectl set-locale LANG=en_US.UTF-8
#ENV LANGUAGE en_US.UTF-8

RUN curl https://mirrors.aliyun.com/repo/Centos-7.repo -o /etc/yum.repos.d/CentOS-Base.repo
RUN yum clean all
RUN yum makecache

RUN yum -y update &&\
	yum install -y gcc gcc-c++ cmake \
		git wget make yasm.x86_64 \
		pkg-config autoconf automake \
		libtool vim curl

RUN mkdir /build
WORKDIR /build

#RUN echo $'export CC=gcc\n\
#    export CXX=g++\n\
#    export LDFLAGS="-L/opt/local/lib"\n\
#    export CFLAGS="-Wall "\n\
#    export CXXFLAGS="-Wall "\n\
#    export CMAKE_C_FLAGS_RELEASE="-s"\n\
#    export CMAKE_CXX_FLAGS_RELEASE="-s"' > /opt/centos-build.env
#RUN echo source /opt/centos-build.env >> ~/.bashrc

RUN mkdir /root/.ssh &&\
    ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""
ADD build-cmake /opt/build-cmake

#cmake install
COPY cmake.Makefile /build/
RUN ["/bin/bash", "-c", "source ~/.bashrc; make -C /build/ -f cmake.Makefile install clean"]

#yasm
COPY yasm.Makefile /build/
#ADD yasm /build/yasm
RUN ["/bin/bash", "-c", "source ~/.bashrc; make -C /build/ -f yasm.Makefile install clean"]


WORKDIR /build

ADD build-cmake /opt/build-cmake

ENTRYPOINT ["/opt/build-cmake"]
