#!/bin/bash

# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/dovecot/*.conf
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/dovecot/*.ext
done

if [ ! -d /var/mail ]
  mkdir /var/mail
  chown lmail:lmail /var/mail
fi

chown lmail:lmail /etc/dovecot/sieve

# Run dovecot
rm -f /var/run/rsyslogd.pid
rm -f /run/dovecot/master.pid
/usr/sbin/dovecot -c /etc/dovecot/dovecot.conf -F & rsyslogd -n
