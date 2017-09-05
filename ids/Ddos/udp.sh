#!/bin/bash


echo "$(tput setaf 7)"
echo "Checking For UDP Flood:"
while :
do
timeout 8 tcpdump -i ens33 -s 65535 > abcd.txt 2> /dev/null
qe=$(egrep -m 1 "UDP" abcd.txt |  awk '{split($3,a,"."); print a[1]"." a[2]"." a[3]"." a[4]}' )
blo=$(egrep "UDP" abcd.txt | wc -l)
qwe=$(iptables -L INPUT -v -n | egrep -m 1 "$qe" | awk '{split($8,a,"."); print a[1]"." a[2]"." a[3]"." a[4]}')
if [ $blo -gt 1000 ]
then
	if [ "$qe" = "$qwe" ]
	then
		echo "$(tput bold)$(tput setaf 2)"
		echo "[+] UDP Flood (DDoS) Attack NOT In Progress (!!!!PREVENTED!!!!)-------------------OK"
	else
		echo "$(tput bold)$(tput setaf 1)"
		echo "[-] UDP Flood (DDoS) Attack In Progress-------------------OK"
		echo "[-] The Attacker's IP is $qe  You May Block This IP in Firewall Option------------------------------OK "
	fi
else
	echo "$(tput bold)$(tput setaf 3)"
	echo "[+] UDP Flood (DDos) Attack NOT in Progress-------------------OK"
fi
done

