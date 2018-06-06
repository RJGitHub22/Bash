#!/bin/bash

# This script can be used to test if a server
# is up or not

file=./servers.txt

#While-Do loop that reads the hostnames one line at a time in servers.txt
while read -r line
do

  #pings the host for 2 seconds and sends output to /dev/null
  ping -c2 $line > /dev/null
  #if statement that displays unsuccesfull pings
  #also keeps counters for servers that are up and down
  if [ $? -eq 0 ]
  then
    $((ServersUp++)) 2>/dev/null
  else
    $((ServersDown++)) 2>/dev/null ; echo "$line is down"
  fi
done < $file

echo
#displays the number of up and down servers
echo "Servers Up:" $ServersUp "Servers Down:" $ServersDown
