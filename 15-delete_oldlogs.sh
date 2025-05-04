#!/bin/bash

SOURCE_FILE=/tmp/shellscript_logs

if [ ! -d $SOURCE_FILE ]
then
echo -e "source file doesn't exist"
else
echo -e "source file exists"
fi

files_to_delete=$(find . -type f -mtime +14 -name *.log)
while IFS= read -r line
do
    echo "deleting old log files $line"
done <<$files_to_delete