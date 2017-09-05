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

FILE="$1"

# make sure we got file-name as command line argument

if [ $# -eq 0 ]
then
echo "Usage :"
echo "$0 <Give Full Path of File or Direcory>"
exit 1
fi
  
which stat > /dev/null
     
# make sure stat command is installed

if [ $? -eq 1 ]
then
echo "stat command not found!"
exit 2
fi
     
# make sure file exists

if [ ! -e $FILE ]
then
echo "$FILE not a file"
exit 3
fi
     
# use stat command to get info
    
echo "Permission of file : $(ls -l $FILE)"
echo "SELinux security context string : $(stat -c %C $FILE)"
echo "Number of hard links : $(stat -c %h $FILE)"

