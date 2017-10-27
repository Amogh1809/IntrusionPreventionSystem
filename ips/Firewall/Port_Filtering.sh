#!/bin/bash

echo "Enter option <1-5> to perform MAC Blocking "
echo
echo "1 = Manually Blocking / Close Incoming Port"
echo "2 = Manually Blocking / Close Outgoing Port "
echo "3 = Manually Allowing / Open TCP Incoming Port "
echo "4 = Manually Allowing / Open UDP Port "
echo "5 = Exit "
echo
read NUM
if [ "$NUM" -eq 1 ]; then 
	echo "You Have Choosen Manually Blocking Of Incoming Port : "
	echo
	echo "Enter The Port you want to block : "
	read Po
	iptables -A INPUT -p tcp --destination-port $Po -j DROP
 	echo "[+] Incoming Port Blocked successfully "
elif [ "$NUM" -eq 2 ]; then
	echo "You Have choosen Manually Blocking Outgoing Port :"
	echo
	echo "Enter The Port you want to Allow : "
	read out
	iptables -A OUTPUT -p tcp --dport $out -j DROP
	echo "[+] Outgoing Port Blocked successfully "
elif [ "$NUM" -eq 3 ]; then
	echo "You Have choosen Manually Allowing / Open TCP Incoming Port :"
	echo
	echo "Enter Port you want to Allow : "
	read qw
	iptables -I INPUT -p tcp --dport $qw -j ACCEPT
	iptables -I INPUT -p tcp --dport $qw --syn -j ACCEPT
	echo "[+] port Open successfully "
elif [ "$NUM" -eq 4 ]; then
	echo "You Have choosen Manually Allowing / Open UDP Port :"
	echo
	echo "Enter The Port you want to Open: "
	read we
	iptables -I INPUT -p udp --dport $we -j ACCEPT
	echo "[+] Port Open successfully "
elif [ "$NUM" -eq 5 ]; then
	echo " Exiting "
	exit 0
else
	echo "Wrong Option Selected"
	exit 0
fi
