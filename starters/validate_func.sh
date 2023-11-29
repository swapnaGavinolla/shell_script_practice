#!/bin/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "installation of $2 $R failre $N"
    exit 1
else
    echo -e "installation of $2 $G success $N"
    exit 1
fi
}

yum install nginx -y 
VALIDATE $? "nginx"

yum install postfix -y 
VALIDATE $? "postfix"

yum install mongod -y 
VALIDATE $? "monod"