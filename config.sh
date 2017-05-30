#!/bin/bash

ST="images/dkim/etc/dkimkeys/SigningTable"
KT="images/dkim/etc/dkimkeys/KeyTable"

echo "Enter your domain eg: example.com"
read domain

echo "* mail._domainkey.$domain" > $ST
echo "mail._domainkey.$domain $domain:mail:/etc/dkimkeys/mail.private" > $KT

cat $ST
cat $KT
