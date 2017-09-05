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


echo "Your current MAC address for the default gateway is:"
echo

# Determine default gateway IP address
ip=$(netstat -rn | grep 0.0.0.0 | awk '{print $2}' | grep --invert-match "0.0.0.0" --max-count=1)
 
# Determine original default gateway MAC address by using found IP address
original_mac=$(arp -a $ip | awk '{print $4}')

echo Current MAC Address----------------------------------------------: $original_mac 
echo Default Gateway IP Address---------------------------------------: $ip

echo
 
while :
do
        # Determine current default gateway IP address
        ip=$(netstat -rn | grep 0.0.0.0 | awk '{print $2}' | grep --invert-match "0.0.0.0" --max-count=1)
       
        # Determine current default gateway MAC address by using found IP address
        current_mac=$(arp -a $ip | awk '{print $4}')
       
        # Compare the two MAC addresses
        if [ $original_mac == $current_mac ]
                then
                        # If both match
                        echo "[+] ARP Poisoning NOT In Progress-------------------OK"
                else
                        # If both do not match get IP address sending ARP broadcasts
                        current_ip=$(arp -v | grep $current_mac --max-count=1 | awk '{print $1}')
                        echo "$(tput bold)$(tput setaf 1)"
                        echo "[-] Alert! MAC ADDRESS CHANGE DETECTED ARP Poisoning In Progress.......!!!!"
                        echo "    Suspect MAC: $current_mac"
                        echo "    Suspect IP: $current_ip $(tput sgr0)"
        fi
        sleep 5s
done
