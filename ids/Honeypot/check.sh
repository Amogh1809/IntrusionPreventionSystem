#!/bin/bash

#    This file is part of Intrusion Detection System By - Raghav Bisht.
#
#    Intrusion Detection System By - Raghav Bisht is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Intrusion Detection System By - Raghav Bisht is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

#sleep 20s
Init_size=$(stat -c %s /root/Desktop/ids/Honeypot/HoneypotLog/Port_Attack_Scan | awk '{print $1}')
echo
while :
do
Curr_size=$(stat -c %s /root/Desktop/ids/Honeypot/HoneypotLog/Port_Attack_Scan | awk '{print $1}')
ip=$(cat /root/Desktop/ids/Honeypot/HoneypotLog/Port_Attack_Scan | awk '{print $2}' | sort -u)
if [ $Curr_size != $Init_size ]
then
echo "$(tput bold)$(tput setaf 1)"
echo "[-] Alert ! Scanning In Progress.......................OK"
echo "Suspect IP : $ip $(tput sgr0)"
else
echo "[+] Scanning NOT In Progress-------------------OK"
fi
sleep 3s
done
