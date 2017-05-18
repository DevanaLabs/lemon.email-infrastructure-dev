#!/bin/bash

echo '151.101.64.249   dl-cdn.alpinelinux.org' >> /etc/hosts
echo '88.198.26.2      spamassassin.apache.org' >> /etc/hosts
echo '192.87.106.226   spamassassin.org' >> /etc/hosts
echo "${SMTP_SERVICE_HOST}    smtp" >> /etc/hosts

# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/amavisd.conf
done

/usr/bin/sa-update

/usr/sbin/amavisd & /usr/sbin/spamd & rsyslogd -n
