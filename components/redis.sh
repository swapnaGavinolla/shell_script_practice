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

yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>LOGFILE
VALIDATE $? "installing redis"

yum module enable redis:remi-6.2 -y &>>LOGFILE
VALIDATE $? "enabling redis"

yum install redis -y &>>LOGFILE
VALIDATE $? "installing redis"

sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf

systemctl enable redis
echo "enabled redis"

systemctl start redis
echo "started redis"