#!/bin/bash

echo checking sudo version

currentver=$(sudo -V | grep -oP '(?<=Sudo version )[^ ]*')

osver=$(cat /etc/lsb-release | grep -oP '(?<=DISTRIB_ID=)[^ ]*')


echo "current version: ${currentver}"
requiredver="1.8.32"
if [ $osver = "Ubuntu" ]; then
 if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then 
        echo "Greater than or equal to ${requiredver}"
 else
        echo "Less than ${requiredver}, version of Sudo is vulnerable"
 fi
else
    echo "This script is only built for ubuntu based systems." 
fi   