FROM ubuntu:latest
MAINTAINER Denys Vitali <denys@denv.it>
RUN apt-get update && apt-get install -y proot \
    git \
    build-essential \
    wget \
    phablet-tools \
    autoconf \
    automake \
    libtool \
    libc6-i386 \
    lib32stdc++6 \
    lib32z1 \
    pkg-config \
    libwayland-dev \
    bison \
    flex \
    bc \
    u-boot-tools \
    glib-2.0 \
    libffi-dev \
    xutils-dev \
    python-mako \
    intltool \
    libxml2-dev \
    curl \
    python
ENV TOP=/app
ENV ARCH=aarch64
WORKDIR /app
