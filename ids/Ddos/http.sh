#!/bin/bash


echo "Checking For HTTP Denial of Service Attack:"
while :
do
check=$(netstat -nap | grep HTTP | wc -l)
if  [ $check -gt 20 ]
then
echo "$(tput bold)$(tput setaf 1)"
echo "[-] HTTP Flood Attack In Progress-------------------OK"
else
echo "[+] HTTP Flood Attack NOT in Progress-------------------OK"
fi
sleep 3s
done
