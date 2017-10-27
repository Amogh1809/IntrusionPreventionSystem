#!/bin/bash

FILE="/tmp/drop.lasso"
URL="http://www.spamhaus.org/drop/drop.lasso"
echo 
echo -n "Applying DROP list to existing firewall..."
[ -f $FILE ] && /bin/rm -f $FILE || :
cd /tmp
wget $URL
blocks=$(cat $FILE  | egrep -v '^;' | awk '{ print $1}')
iptables -N droplist
for ipblock in $blocks
do
 iptables -A droplist -s $ipblock -j LOG --log-prefix "DROP List Block"
 iptables -A droplist -s $ipblock -j DROP
done
iptables -I INPUT -j droplist
iptables -I OUTPUT -j droplist
iptables -I FORWARD -j droplist
echo "...Done"

