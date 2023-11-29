#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
#LOGFILE= /tmp/Shell.log

VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "installation of $2 $R failre $N"
    exit 1
else
    echo -e "installation of $2 $G success $N"
fi
}
 
yum install nginx -y &>> LOGFILE
VALIDATE $? "nginx" 

yum install postfix -y &>> LOGFILE
VALIDATE $? "postfix"

yum install mysql -y &>> LOGFILE
VALIDATE $? "redis"