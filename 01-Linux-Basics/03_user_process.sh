#!/bin/bash
read -p "Would you like to sort the proceeses by memory or CPU? Enter m or c: " sortBy
read -p "Enter the number of lines you want the output: " lines
if [ "$sortBy" == "m" ]
  then
    ps aux --sort -%mem | egrep "PID|$USER" | head -"$lines"
elif [ "$sortBy" == "c" ]
  then
    ps aux --sort -%cpu | egrep "PID|$USER" | head -"$lines"
fi
