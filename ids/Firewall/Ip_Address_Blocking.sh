#!/bin/bash


echo "Enter option <1-3> to perform IP Blocking "
echo
echo "1 = Manually Blocking"
echo "2 = Manually Allowing "
echo "3 = Exit "
echo
read NUM
if [ "$NUM" -eq 1 ]; then 
	echo "You Have Choosen Manually Blocking Of IP : "
	echo
	echo "Enter The Ip Address you want to block : "
	read ip
	iptables -A INPUT -s $ip -j DROP
	iptables -A INPUT -s $ip -p tcp --destination-port 80 -j DROP
	iptables -A INPUT -s $ip -p tcp --destination-port 443 -j DROP
	sudo ufw deny from $ip 
	echo "[+] Ip blocked successfully "
elif [ "$NUM" -eq 2 ]; then
	echo "You Have choosen Manually Allowing Of IP :"
	echo
	echo "Enter The Ip Address you want to Allow : "
	read al
	iptables -D INPUT -s $al -j DROP
	sudo ufw allow from $al
elif [ "$NUM" -eq 3 ]; then
	echo " Exiting "
	exit 0
else
	echo "Wrong Option Selected"
	exit 0
fi
