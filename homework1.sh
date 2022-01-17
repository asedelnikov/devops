#!/bin/bash
m=`ls /sys/class/net`
for i in $m
do
h=`ip a|grep $i$|grep inet|awk '{print $2}'`
o=`ip ro|grep default|awk '{print $1}'`
l=`ip ro|grep default|awk '{print $5}'`
if [ "$l" == "$i" ]; then
echo -e '\033[0;31m'$i' \033[0;35m'$h'\033[0;32m default\033[0m'
else
echo -e '\033[0;31m'$i' \033[0;35m'$h'\033[0m'
fi
done
