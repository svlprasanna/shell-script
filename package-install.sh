#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo -e "you are not root user"
else
echo -e "you are root user now"
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    echo -e "$2 failed"
    else
    echo -e "$2 success"
    fi
}

echo -e "please enter packages to be installed are: $@"

for package in $@
do
    yum installed $package
    if [ $? -ne 0 ]
    then
    yum install $package -y
    VALIDATE $? "installing $package"
    else
    echo -e " package is already installed"
    fi
done

