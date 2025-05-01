#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo -e " script started executing at $G $TIMESTAMP"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "script name is :$R $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$R ERROR : installing $2 is failed"
    exit 1
    else
    echo -e "$G installing $2 is success..."
    fi
}

if [ $ID -ne 0 ]
then
echo -e "$R error:please run with root access"
exit 1
else
echo -e "$G you are root user"
fi

yum install mysql -y &>> $LOGFILE
VALIDATE -e $? "$G Installing mysql"

yum install git -y &>> $LOGFILE
VALIDATE -e $? "$Y installing git"