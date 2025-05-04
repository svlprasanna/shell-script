#!/bin/bash

FILE="/home/centos/shell-script/text.txt"

if [ ! -f $FILE ]
then    
echo "file doesn't exist"
else
echo "file exist in the system"
fi

while IFS= read -s $FILE
do
count=$(cat $FILE | wc -w " ")
echo "words in the file are: $count)
done
