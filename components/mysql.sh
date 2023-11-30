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

yum module disable mysql -y &>>LOGFILE
VALIDATE $? "disabling mysql"

cp /root/shell_script_practice/components/mysql.repo /etc/yum.repos.d/mysql.repo
#cp /root/shell_script_practice/components/mongo.repo /etc/yum.repos.d/mongo.repo

yum install mysql-community-server -y &>>LOGFILE
VALIDATE $? "installing mysql community server"

systemctl enable mysqld
echo "enabled mysql"

systemctl start mysqld
echo "started mysql"

mysql_secure_installation --set-root-pass RoboShop@1

mysql -uroot -pRoboShop@1
 