#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(+%F-%H-%M-%S)
echo -e "$Y script started running at $TIMESTAMP $N"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "installation of $R $2 failed $N"
    else
    echo -e "installation of $G $2 is success $N"
fi
}
if [ $ID -ne 0 ]
    then
    echo -e "$R you are not root user $N"
    exit 1
    else
    echo -e "$G you are root user $N"
fi

echo -e "$Y all arguments passed are : $@ $N"

for package in $@
do
    yum list installed $package
    if [ $? -ne 0 ]
    then
        yum install $package -y
        VALIDATE $? "installing $package"
        else
        echo -e "$G $package is already installed $N"
    fi
done
