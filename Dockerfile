FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install --no-install-recommends -y \
    libboost-date-time1.55.0 libboost-filesystem1.55.0 \
    libboost-locale1.55.0 libboost-program-options1.55.0 \
    libboost-regex1.55.0 libboost-system1.55.0 libcrypto++9 \
    libfcgi0ldbl libmemcached11 libmemcachedutil2 libpqxx-4.0 \
    libxml2 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD cgimap.tar.gz /

RUN ldconfig

ENV CGIMAP_LOGFILE /dev/stdout
ENV CGIMAP_INSTANCES 10
ENV CGIMAP_PIDFILE /dev/null
ENV CGIMAP_PORT 8000

EXPOSE 8000

CMD ["/usr/local/bin/openstreetmap-cgimap"]
