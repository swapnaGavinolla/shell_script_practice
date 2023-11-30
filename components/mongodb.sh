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
fi
}

cp /root/shell_script_practice/components/mongo.repo /etc/yum.repos.d/mongo.repo
echo "copied" 

yum install mongodb-org -y &>>LOGFILE
VALIDATE $? "installing mongodb"

systemctl enable mongod
echo "enabled mongod"

systemctl start mongod
echo "started mongod"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>LOGFILE

systemctl restart mongod
echo "started mongod"