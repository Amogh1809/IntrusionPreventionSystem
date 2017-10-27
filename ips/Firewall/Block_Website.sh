#!/bin/bash


echo "Enter option <1-3> to perform to Block Website "
echo
echo "1 = Manually Blocking Website"
echo "2 = Manually Unblocking Website"
echo "3 = Exit "
echo "Enter :"
read NUM
if [ "$NUM" -eq 1 ]; then 
	echo "You Have Choosen Manually Blocking Website : "
	echo
	echo "Enter The website name you want to block : "
	read site
	sudo sh -c 'echo "0.0.0.0 '$site'" >> /etc/hosts'
	sudo sh -c 'echo "127.0.0.1 '$site'" >> /etc/hosts' 
	echo "[+] Website blocked successfully "
elif [ "$NUM" -eq 2 ]; then
	echo "You Have choosen Manually Unblocking Website :"
	echo
	gedit /etc/hosts
elif [ "$NUM" -eq 3 ]; then
	echo " Exiting "
exit 0
	else
	echo "Wrong Option Selected"
exit 0
fi
