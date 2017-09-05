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

echo "Enter Your Network Interface :"
read fa
echo
echo
tshark -i $fa -f "ip proto 6 or ip proto 17" -R "tcp.flags == 16 or tcp.flags == 1 or tcp.flags == 2 or tcp.flags == 18 or tcp.flags == 41 or tcp.flags == 16 or tcp.flags == 0 or ip.len == 28 or icmp.type == 8" >> /root/Desktop/ids/Honeypot/HoneypotLog/Port_Attack_Scan

