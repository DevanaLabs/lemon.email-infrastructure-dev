FROM alpine:3.5

ENV DOVECOT_VERSION=2.2.27-r0
ENV DOVECOT_MYSQL_VERSION=2.2.27-r0
ENV DOVECOT_DOC_VERSION=2.2.27-r0
ENV DOVECOT_PIGEONHOLE_PLUGIN_VERSION=2.2.27-r0

RUN apk add --update \
     dovecot=${DOVECOT_VERSION} \ 
     dovecot-mysql=${DOVECOT_MYSQL_VERSION} \
     dovecot-doc=${DOVECOT_DOC_VERSION} \
     dovecot-pigeonhole-plugin=${DOVECOT_PIGEONHOLE_PLUGIN_VERSION} \
     rsyslog \
     bash \
 && rm -rf /var/cache/apk/*

COPY dovecot /etc/dovecot
COPY rsyslog.conf /etc/rsyslog.conf

RUN adduser -D -u 9001 lmail

COPY start.sh /start.sh

CMD ["/start.sh"]
