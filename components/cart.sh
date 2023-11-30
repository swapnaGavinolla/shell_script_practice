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
        echo "directory is created"
    else
        echo "directory already exists"
    fi
}
  

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>> LOGFILE
VALIDATE $? "npm source"

yum install nodejs -y &>> LOGFILE 
VALIDATE $? "nodejs" 

check_user roboshop

check_directory_existence /app

curl -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip  &>> LOGFILE
VALIDATE $? "downloading zip files"

cd /app 

unzip /tmp/cart.zip &>> LOGFILE
VALIDATE $? "unzipping"

cd /app

npm install &>> LOGFILE
VALIDATE $? "npm"

cp /root/shell_script_practice/components/cart.service /etc/systemd/system/cart.service
VALIDATE $? "copied"

systemctl daemon-reload
echo "demon reloaded"

systemctl enable cart
echo "enabled cart"

systemctl start cart
echo "started cart"

