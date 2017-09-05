#!/bin/bash



echo "$(tput setaf 7)"
echo "Checking For TCP/IP Denial of Service Attack:"
while :
do
timeout 8 tcpdump -i ens33 -s 65535 > abcd.txt 2> /dev/null
qe=$(egrep -m 1 "Flags \[S\]" abcd.txt |  awk '{split($3,a,"."); print a[1]"." a[2]"." a[3]"." a[4]}' )
blo=$(egrep "Flags \[R.\]" abcd.txt | wc -l)
if [ $blo -gt 0 ]
then
	output=$(egrep "Flags \[S\]" abcd.txt | wc -l )  
	if [ $output -gt 1000 ] 
	then
	echo "$(tput bold)$(tput setaf 1)"
echo "[-] TCP/IP Denial of Service Attack In Progress-------------------OK"
echo "[-] The Attacker's IP is $qe  You May Block This IP in Firewall Option------------------------------OK "
else
echo "$(tput bold)$(tput setaf 3)"
echo "[+] TCP/IP Denial of Service Attack NOT in Progress-------------------OK"
fi
else
	output=$(egrep "Flags \[S\]" abcd.txt | wc -l )  
	if [ $output -gt 1000 ] 
	then
	echo "$(tput bold)$(tput setaf 2)"
	echo "[+] TCP/IP Denial of Service Attack NOT In Progress (!!!!PREVENTED!!!!)-------------------OK"
	else
	echo "$(tput bold)$(tput setaf 3)"
	echo "[+] TCP/IP Denial of Service Attack NOT in Progress-------------------OK"
	fi
fi
done

