#!/bin/bash
# This was a simple Script which scans at a level4 and lists everything we want of open ports
# Please note instead of running this script you can simply run nmap -T4 -p- -A- <ip address>


if ["$1" == ""]
then 
echo "ERROR"
echo "Please specify a valid ip"
echo "Syntax : ./portscan.sh <ip address>"

else
nmap -T4 -Pn -p- $1 > Result.txt; #saved output into Result.txt file

cat Result.txt | grep "open" | cut -d " " -f 1 | tr -d "/tcp" | tr "\n" "," | sed 's/.$//' > openports.txt;


nmap -T4 -Pn  -p $(cat openports.txt) -A $1 > finalresults.txt ;

rm -rf Result.txt

rm -rf openports.txt


fi

