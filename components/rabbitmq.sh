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

curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash  &>>LOGFILE
VALIDATE $? "installing dependencies by vedor"

curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>LOGFILE
VALIDATE $? "configure yum repo"

yum install rabbitmq-server -y &>>LOGFILE
VALIDATE $? "installing rabbitmq-server"

systemctl enable rabbitmq-server 
echo "enabled rabbitmq-server"

systemctl start rabbitmq-server 
echo "enabled rabbitmq-server"

rabbitmqctl add_user roboshop roboshop123

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"