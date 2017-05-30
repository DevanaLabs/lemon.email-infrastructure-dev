#!/bin/sh

cp /etc/dkimkeys/mail/mail.private /etc/dkimkeys/mail.private
chown opendkim:opendkim /etc/dkimkeys/mail.private
chmod 600 /etc/dkimkeys/mail.private

/etc/init.d/opendkim start & /etc/init.d/opendmarc start & rsyslogd -n
