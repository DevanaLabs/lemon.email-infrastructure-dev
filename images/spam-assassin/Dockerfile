FROM alpine:3.5

ENV AMAVISD_NEW_VERSION=2.11.0-r0
ENV SPAMASSASSIN_VERSION=3.4.1-r5

RUN apk add --update \
     amavisd-new=${AMAVISD_NEW_VERSION} \
     spamassassin=${SPAMASSASSIN_VERSION} \
     wget \
     rsyslog \
     bash \
 && rm -rf /var/cache/apk/*

COPY conf/amavisd.conf /etc/
COPY rsyslog.conf /etc/rsyslog.conf

COPY start.sh /start.sh

RUN /usr/bin/sa-update

EXPOSE 10024

CMD ["/start.sh"]
