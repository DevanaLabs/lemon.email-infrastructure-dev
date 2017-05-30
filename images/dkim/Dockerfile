FROM ubuntu:16.04

ENV OPENDKIM_VERSION=2.10.3-3build1
ENV OPENDKIM_TOOLS_VERSION=2.10.3-3build1
ENV OPENSSL_VERSION=1.0.2g-1ubuntu4.6
ENV OPENDMARC_VERSION=1.3.1+dfsg-3

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install opendkim=${OPENDKIM_VERSION} \
        rsyslog \
        openssl=${OPENSSL_VERSION} \
        opendmarc=${OPENDMARC_VERSION} \
        opendkim-tools=${OPENDKIM_TOOLS_VERSION} \
        bash \
    && rm -rf /var/cache/apk/*

COPY etc/ /etc/
COPY rsyslog.conf /etc/rsyslog.conf

EXPOSE 8891

COPY start.sh /start.sh

CMD ["/start.sh"]