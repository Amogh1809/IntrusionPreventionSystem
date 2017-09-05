#!/bin/bash


echo "Enter option <1-5> to perform MAC Blocking "
echo
echo "1 = Manually Blocking MAC Address"
echo "2 = Manually Allowing MAC Address "
echo "3 = Manually Allowing SSH Access to Specific MAC Address "
echo "4 = Manually Denying SSH Access to Specific MAC Address "
echo "5 = Exit "
echo
read NUM
if [ "$NUM" -eq 1 ]; then 
	echo "You Have Choosen Manually Blocking Of MAC Address : "
	echo
	echo "Enter The MAC Address you want to block : "
	read mac
	iptables -A INPUT -m mac --mac-source $mac -j DROP
	iptables -A FORWARD -m mac --mac-source $mac -j DROP
	echo "[+] MAC Address Blocked successfully "
elif [ "$NUM" -eq 2 ]; then
	echo "You Have choosen Manually Allowing Of MAC Address :"
	echo
	echo "Enter The MAC Address you want to Allow : "
	read al
	iptables -I INPUT -m mac --mac-source $al -j ACCEPT
	echo "[+] MAC Address Allow successfully "
elif [ "$NUM" -eq 3 ]; then
	echo "You Have choosen Manually Allowing SSH Access to Specific MAC Address :"
	echo
	echo "Enter The MAC Address you want to Allow : "
	read qw
	iptables -I INPUT -p tcp --dport 22 -m mac --mac-source $qw -j ACCEPT
	echo "[+] MAC Address Allow successfully "
elif [ "$NUM" -eq 4 ]; then
	echo "You Have choosen Manually Denying SSH Access to Specific MAC Address :"
	echo
	echo "Enter The MAC Address you want to Block : "
	read we
	iptables -I INPUT -p tcp --dport 22 -m mac --mac-source $we -j REJECT
	echo "[+] MAC Address Blocked successfully "
elif [ "$NUM" -eq 4 ]; then
	echo " Exiting "
	exit 0
else
	echo "Wrong Option Selected"
	exit 0
fi
