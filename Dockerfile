# Based on Debian Jessie
FROM debian:jessie

# Install macOS cross compilers
ADD osxcross.tar.xz /usr

# Install build tools
RUN \
  apt-get update && \
  apt-get install -y \
        autoconf            \
        automake            \
        bison               \
        build-essential     \
        curl                \
        clang               \
        file                \
        flex                \
        git                 \
        libtool             \
        pkg-config          \
        python              \
        texinfo             \
        vim                 \
        wget                \
        xz-utils            \
        mingw-w64 && \
  apt-get clean

# Install musl-cross compilers
RUN \
  mkdir /build && \
  cd /build && \
  git clone https://github.com/richfelker/musl-cross-make && \
  cd musl-cross-make && \
  echo 'OUTPUT = /opt/cross' >> config.mak && \
  echo 'COMMON_CONFIG += --disable-nls' >> config.mak && \
  echo 'COMMON_CONFIG += CFLAGS="-g0 -O2" CXXFLAGS="-g0 -O2" LDFLAGS="-s"' >> config.mak && \
  echo 'GCC_CONFIG += --enable-languages=c,c++' >> config.mak && \
  echo 'GCC_CONFIG += --disable-multilib' >> config.mak && \
  echo 'GCC_CONFIG += --disable-libquadmath --disable-decimal-float' >> config.mak && \
  make install TARGET=arm-linux-musleabihf && \
  make install TARGET=aarch64-linux-musl && \
  make install TARGET=mips-linux-musl && \
  make install TARGET=x86_64-linux-musl && \
  make install TARGET=i486-linux-musl && \
  cd / && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /build

# Image metadata
ENV PATH $PATH:/usr/osxcross/bin:/opt/cross/bin
CMD /bin/bash
WORKDIR /workdir
