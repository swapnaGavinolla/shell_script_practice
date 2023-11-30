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

yum install python36 gcc python3-devel -y &>> LOGFILE
VALIDATE $? "insatlling python.."

check_user roboshop

check_directory_existence /app

curl -L -o /tmp/payment.zip https://roboshop-builds.s3.amazonaws.com/payment.zip &>> LOGFILE
VALIDATE $? "downloading depenencies"

cd /app 

unzip /tmp/payment.zip &>> LOGFILE
VALIDATE $? "unzipping"

cd /app 
echo "changed dir"

pip3.6 install -r requirements.txt  &>> LOGFILE
VALIDATE $? "installing requirements"

cp /root/shell_script_practice/components/payment.service  /etc/systemd/system/payment.service

systemctl daemon-reload
echo "daemon-reloaded"

systemctl enable payment 
echo "enabled payment"

systemctl start payment
echo "started payment"