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

echo " Press Option <1-7> To Check System Logs "
echo
echo "1 = Last Login Time "
echo "2 = Last Boot Time "
echo "3 = Last Reboot Time "
echo "4 = Last Shutdown Time "
echo "5 = Full Reboot Report"
echo "6 = Full Shutdown Report"
echo "7 = Exit"
echo
read NUM
if [ "$NUM" -eq 1 ]; then 
echo " Last Login is : "
last login
elif [ "$NUM" -eq 2 ]; then
echo "Last Boot Time is :"
who -b
elif [ "$NUM" -eq 3 ]; then 
echo " Last Reboot Time is : "
last reboot | head -1
elif [ "$NUM" -eq 4 ]; then
echo "Last Shutdown Time is :"
last -x | grep shutdown | head -1
elif [ "$NUM" -eq 5 ]; then
echo " Full Reboot Report is : "
last reboot
elif [ "$NUM" -eq 6 ]; then
echo " Full Shutdown Report is :"
last -x | grep shutdown
elif [ "$NUM" -eq 7 ]; then
exit 0
else " Invalid Option : "
exit 0
fi

