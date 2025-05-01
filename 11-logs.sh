#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "script name is :$R $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$R ERROR : installing $2 is failed"
    exit 1
    else
    echo "$G installing $2 is success..."
    fi
}

if [ $ID -ne 0 ]
then
echo -e "$R error:please run with root access"
exit 1
else
echo "$G you are root user"
fi

yum install mysql -y &>> $LOGFILE
VALIDATE $? "$G Installing mysql"

yum install git -y &>> $LOGFILE
VALIDATE $? "$Y installing git"