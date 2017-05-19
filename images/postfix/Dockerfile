FROM alpine:3.5

ENV POSTFIX_VERSION=3.1.3-r0
ENV POSTFIX_POLICYD_SPF_PERL_VERSION=2.007-r2
ENV POSTFIX_MYSQL_VERSION=3.1.3-r0

RUN apk add --update \
     postfix=${POSTFIX_VERSION} \
     postfix-policyd-spf-perl=${POSTFIX_POLICYD_SPF_PERL_VERSION} \
     postfix-mysql=${POSTFIX_MYSQL_VERSION} \
     rsyslog \
     bash \
 && rm -rf /var/cache/apk/* 

COPY postfix /etc/postfix
COPY rsyslog.conf /etc/rsyslog.conf

COPY start.sh /start.sh

CMD ["/start.sh"]