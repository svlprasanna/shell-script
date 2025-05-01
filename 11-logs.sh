#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script name is : $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "ERROR : installing $2 is failed"
    exit 1
    else
    echo "installing $2 is success..."
    fi
}

if [ $ID -ne 0 ]
then
echo "error:please run with root access"
exit 1
else
echo "you are root user"
fi

yum install mysql -y &>> $LOGFILE
VALIDATE $? "Installing mysql"

yum install git -y &>> $LOGFILE
VALIDATE $? "installing git"