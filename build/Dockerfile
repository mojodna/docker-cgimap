FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install --no-install-recommends -y \
    libxml2-dev libpqxx-dev libfcgi-dev libboost-dev libboost-regex-dev \
    libboost-program-options-dev libboost-date-time-dev \
    libboost-filesystem-dev libboost-locale-dev libboost-system-dev \
    libcrypto++-dev libmemcached-dev build-essential automake autoconf \
    libtool && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD cgimap.tar.gz /tmp/

RUN mkdir -p /app && \
  cp -r /tmp/openstreetmap-cgimap-*/* /app/ && \
  rm -rf /tmp/openstreetmap-cgimap-*

WORKDIR /app

RUN ./autogen.sh && \
  ./configure && \
  make -j $(nproc) install
