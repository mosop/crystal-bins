FROM alpine:3.5

ARG spec
ARG ignore_failure

RUN true \
  && apk --update add --virtual crystal-bins-build-dependencies \
    llvm-dev \
    git \
    curl \
    autoconf \
    automake \
    libtool \
    make \
    gcc \
    g++ \
  && apk add \
    zlib-dev \
    pcre-dev \
    libevent-dev \
    yaml-dev \
    openssl-dev \
    libxml2-dev \
    gmp-dev \
    readline-dev

ADD . /

RUN true \
  && cd /crystal-bins \
  && bin/build install $spec $ignore_failure

WORKDIR /crystal-bins
ENTRYPOINT ["/bin/sh"]
