#!/bin/bash

FILE=/home/centos/shell-script/text.txt

if [ ! -f $FILE ]
then    
echo "file doesn't exist"
else
echo "file exist in the system"
fi

word_count= $( tr -d $FILE)

while( read -s word)
do
echo "words in the file are $word"
done
