#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
THRESHOLD=1

while IFS= read line
do
usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
partition=$(echo $lline | awk '{print $1F}')

if [ $usage -gt $partition ]
then
    message+="disk usage on $partition is: $usage"
fi
done <<< $DISK_USAGE

echo "MESSAGE:$message"

echo "$message" | mail -s "high disk usage" lakshmimohan1216@gmail.com


