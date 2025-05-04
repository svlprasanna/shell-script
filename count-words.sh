#!/bin/bash

FILE=/home/centos/shell-script/text.txt

if [ ! -f $FILE ]
then    
echo "file doesn't exist"
else
echo "file exist in the system"
fi

word_count= $( tr -s $FILE)

echo "words in the file are $word_count"
