#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo -e "you are not root user"
else
echo -e "you are root user now"
fi

VALIDATE(){
    echo -e "$1 installation failed"
    else
    echo -e "$1 installation success"
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

