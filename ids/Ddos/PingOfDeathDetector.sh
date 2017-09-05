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
tshark -i wlan0 -R "icmp.type == 8" -c 200 >> /root/Desktop/ids/Ddos/DdosLogs/ping_of_death
echo ""
echo "[+] Sniffing Finished           [OK]"
echo ""
echo "[+] Loading Result              [OK]"
sleep 3s
echo "----------------------------------------------------------------------------------"
echo ">>-------------IP-Address Of Device Performing Ping Of Death Are------------------<<"
echo "----------------------------------------------------------------------------------"
echo ""
cat /root/Desktop/ids/Ddos/DdosLogs/ping_of_death | awk '{print $2}' | sort -u
echo ""
