FROM ubuntu:14.04.5

ARG ver
ARG pkgver
ARG target

RUN \
  apt-get update && \
  apt-get install -y --force-yes software-properties-common apt-transport-https && \
  apt-add-repository "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main" && \
  apt-add-repository "deb https://dist.crystal-lang.org/apt crystal main" && \
  apt-get update && \
  apt-get install -y --force-yes git gcc llvm-3.8-dev crystal=$pkgver && \
  export PATH=/opt/crystal/bin:$PATH && \
  git clone --depth=1 -b $ver https://github.com/crystal-lang/crystal.git && \
  cd crystal && \
  CRYSTAL_CONFIG_VERSION=$ver crystal build -o ../crystal-$target-$pkgver src/compiler/crystal.cr \
    -D i_know_what_im_doing -D without_openssl -D without_zlib \
    --cross-compile --target $target \
    --stats --verbose && \
  apt-get remove --purge -y software-properties-common apt-transport-https git gcc llvm-3.8-dev crystal && \
  apt-get autoremove -y && \
  apt-get clean && \
  cd / && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* crystal
