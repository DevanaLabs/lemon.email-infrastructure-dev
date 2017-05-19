FROM alpine:3.5
MAINTAINER Radivoje Peskic <radivoje.peskic@lemon.email>

RUN apk add --update mysql mysql-client

COPY my.cnf /etc/mysql/my.cnf
COPY postfixadmin.sql /tmp/postfixadmin.sql
COPY blockemon.sql /tmp/blockemon.sql
COPY start.sh /start.sh

EXPOSE 3306
CMD ["/start.sh"]
