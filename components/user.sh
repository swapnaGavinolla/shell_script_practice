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
  

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>> LOGFILE
VALIDATE $? "npm source"

yum install nodejs -y &>> LOGFILE 
VALIDATE $? "nodejs" 

check_user roboshop

check_directory_existence /app

curl -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip  &>> LOGFILE
VALIDATE $? "downloading zip files"

cd /app 

unzip /tmp/user.zip &>> LOGFILE
VALIDATE $? "unzipping"

cd /app

npm install &>> LOGFILE
VALIDATE $? "npm"

cp /root/shell_script_practice/components/user.service /etc/systemd/system/user.service
VALIDATE $? "copied"

systemctl daemon-reload
echo "daemon-reloaded"

systemctl enable user
echo "enabled user"

systemctl start user
echo "started cart"

cp /root/shell_script_practice/components/mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "copied mongo repo"

yum install mongodb-org-shell -y &>> LOGFILE
VALIDATE $? "mongo-org"

mongo --host 172.31.47.44 </app/schema/user.js  &>> LOGFILE

