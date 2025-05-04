#!/bin/bash

SOURCE_FILE= /etc/passwd

if [ ! -d $SOURCE_FILE ]
then
echo -e "source file doesn't exist"
exit 1
else
echo -e "source file exists"
fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir
do
echo "username: $username"
echo "user ID: $user_id"
echo "password: $password"
done