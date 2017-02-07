FROM ubuntu:14.04

ARG spec
ARG ignore_failure

RUN true \
  && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" >> sources.list \
  && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-updates main restricted universe multiverse" >> sources.list \
  && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-backports main restricted universe multiverse" >> sources.list \
  && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty-security main restricted universe multiverse" >> sources.list \
  && cat /etc/apt/sources.list >> sources.list \
  && mv sources.list /etc/apt/sources.list \
  && echo "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.9 main" >> /etc/apt/sources.list \
  && echo "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.9 main" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y --force-yes \
    llvm-3.9-dev \
    git \
    curl \
    patch \
    pkg-config \
    automake \
    libtool \
    make \
    gcc \
    g++ \
    zlib1g-dev \
    libpcre3-dev \
    libevent-dev \
    libyaml-dev \
    libssl-dev \
    libxml2-dev \
    libgmp-dev \
    libreadline-dev
  && update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-3.9 100

ADD . /

RUN true \
  && cd /crystal-bins \
  && bin/build install $spec $ignore_failure

WORKDIR /crystal-bins
ENTRYPOINT ["/bin/sh"]
