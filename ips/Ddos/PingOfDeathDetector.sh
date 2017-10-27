#!/bin/bash

rm /home/amoghbabbar/Desktop/vips/ids/Ddos/DdosLogs/ping_of_death
echo "Checking For Ping Of Death Attack :"
echo ""
echo "[+] Loading Sniffer             [Ok]"
echo ""
sleep 5s
echo "[+] Your Result Will Be Up In 20 Seconds."
echo ""
sleep 3s
echo "[+] Sniffing Started            [OK]"
echo ""
timeout 5 tshark -i ens33 -Y "icmp.type == 8" -c 200 >> /home/amoghbabbar/Desktop/vips/ids/Ddos/DdosLogs/ping_of_death 2> /dev/null
echo ""
echo "[+] Sniffing Finished           [OK]"
echo ""
echo "[+] Loading Result              [OK]"
sleep 3s
echo "----------------------------------------------------------------------------------"
echo ">>-------------IP-Address Of Device Performing Ping Of Death Are------------------<<"
echo "----------------------------------------------------------------------------------"
echo ""
cat /home/amoghbabbar/Desktop/vips/ids/Ddos/DdosLogs/ping_of_death | awk '{print $3}' | sort -u
echo ""
echo "Please block the above IP Adresses in the Firewall Option."
