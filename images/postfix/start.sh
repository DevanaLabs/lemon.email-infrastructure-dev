#!/bin/bash

echo '{{ HOSTNAME }}' > /etc/hostname
# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/*.cf
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/mysql/*.cf
done

# Fix alias error
postmap /etc/postfix/aliases

# Run Postfix
rm -f /var/run/rsyslogd.pid
rm -f /run/dovecot/master.pid
/usr/lib/postfix/master & rsyslogd -n
