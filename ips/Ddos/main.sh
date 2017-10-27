#!/bin/bash



echo "--------------------------------------------------------------"
echo ">>----------------AVAILABLE INTERFACE LIST------------------<<"
echo "--------------------------------------------------------------"
echo ""
cat /tmp/ethlist
echo ""
echo "--------------------------------------------------------------"
echo ""
echo "You Got 120 Second To Fill The Interface Name & Port <1-65000>"
xterm -hold -e sh /root/Desktop/ids/Ddos/Check_Flooding.sh | sh /root/Desktop/ids/Ddos/Check.sh


