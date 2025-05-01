#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "installation of $2 failed"
    else
    echo " installation of $2 is success"
fi
}
if [ $ID -ne 0 ]
    then
    echo "you are not root user"
    exit 1
    else
    echo "you are root user"
fi

echo "all arguments passed are : $@"

for package in $@
do
    yum list installed $package
    if [ $? -ne 0 ]
    then
        yum install $package -y
        VALIDATE $? "installing $package"
        else
        echo "$package is already installed"
    fi
done
