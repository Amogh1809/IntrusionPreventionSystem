#!/bin/bash



echo "Your current MAC address for the default gateway is:"
echo

ip=$(netstat -rn | grep 0.0.0.0 | awk '{print $2}' | grep --invert-match "0.0.0.0" --max-count=1)
 
original_mac=$(arp -a $ip | awk '{print $4}')

echo Current MAC Address----------------------------------------------: $original_mac 
echo Default Gateway IP Address---------------------------------------: $ip
echo
 
while :
do
        ip=$(netstat -rn | grep 0.0.0.0 | awk '{print $2}' | grep --invert-match "0.0.0.0" --max-count=1)
       
        current_mac=$(arp -a $ip | awk '{print $4}')

        if [ "$original_mac" = "$current_mac" ]
                then
                        echo "[+] ARP Poisoning NOT In Progress-------------------OK"
                else
                        current_ip=$(arp -v | grep -m1 $current_mac | tail -n1 | awk '{print $1}')
                        echo "$(tput bold)$(tput setaf 1)"
                        echo "[-] Alert! MAC ADDRESS CHANGE DETECTED ARP Poisoning In Progress.......!!!!"
                        echo "    Suspect MAC: $current_mac"
                        echo "    Suspect IP: $current_ip $(tput sgr0)"
                        echo "    Kindly block this IP and MAC from your Router Settings. "
        fi
        sleep 5s
done
