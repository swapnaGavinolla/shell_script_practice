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

check_user(){
    id $1 &>> logfile
    if [ $? -ne 0 ]
then 
    useradd $1
    echo "user $1 added"

else
    echo " $1 already exits"
fi
}

check_directory_existence (){
    /$1 &>> LOGFILE
    if [ $? -ne 0 ]
    then
        mkdir $1 &>> logfile
        echo " directory is created"
    else
        echo "directory already exists"
    fi
}

yum install maven -y &>> LOGFILE 
VALIDATE $? "npm source"

check_user roboshop

check_directory_existence /app

curl -L -o /tmp/shipping.zip https://roboshop-builds.s3.amazonaws.com/shipping.zip &>> LOGFILE 
VALIDATE $? "npm source"

cd /app 

unzip /tmp/shipping.zip &>> LOGFILE
VALIDATE $? " unzi"

cd /app

mvn clean package &>> LOGFILE 
VALIDATE $? "package"

mv target/shipping-1.0.jar shipping.jar

cp /root/shell_script_practice/components/shipping.service /etc/systemd/system/shipping.service
echo "copied shipping.service"

systemctl daemon-reload
echo "demon reloaded"

systemctl enable shipping 
echo "enabled shipping"

systemctl start shipping
echo "satrted shipping"

yum install mysql -y &>> LOGFILE 
VALIDATE $? "npm source"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql 

systemctl restart shipping
echo "satrted shipping"