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

echo "--------------------------------------------------------------"
echo ">>----------------AVAILABLE INTERFACE LIST------------------<<"
echo "--------------------------------------------------------------"
echo ""
cat /tmp/ethlist
echo ""
echo "--------------------------------------------------------------"
echo ""
echo "You Got 120 Second To Fill The Interface Name Or It Will Start Automatically"
xterm -hold -e sh /root/Desktop/ids/Honeypot/Port_Scan_attack_Detect.sh | xterm -hold -e sh /root/Desktop/ids/Honeypot/check.sh


