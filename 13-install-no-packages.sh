#!/bin/bash

ID=$(id -u)

if [$ID -ne 0]
then
echo "you are not root user"
else
echo "you are root user"
fi

echo "all arguments passed are : $@"

