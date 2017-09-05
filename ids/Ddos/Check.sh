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

echo "loading..."
sleep 15s
Init_pro=$(ps -a | grep tcpdump --count)
echo
while :
do
Curr_pro=$(ps -a | grep tcpdump --count)
if [ $Init_pro == $Curr_pro ]
then
echo "[+] Flooding NOT In Progress-------------------OK"
else
echo "$(tput bold)$(tput setaf 1)"
echo "[-] Flooding In Progress.......................OK"
fi
sleep 3s
done
