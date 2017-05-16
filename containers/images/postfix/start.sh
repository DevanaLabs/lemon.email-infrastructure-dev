#!/bin/bash

echo '{{ HOSTNAME }}' > /etc/hostname
# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/*.cf
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/postfix/mysql/*.cf
done

echo "test"

# Fix alias error
postmap /etc/postfix/aliases

# Actually run Postfix
rm -f /var/run/rsyslogd.pid
rm -f /run/dovecot/master.pid

#/usr/sbin/opendkim -x /etc/opendkim.conf 
/usr/lib/postfix/master & rsyslogd -n
