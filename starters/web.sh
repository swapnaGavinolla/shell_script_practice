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

yum install nginx -y &>> LOGFILE
VALIDATE $? "nginx"

systemctl enable nginx 
echo "enabled nginx"

systemctl start nginx
echo "started nginx"

rm -rf /usr/share/nginx/html/*


curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip  &>> LOGFILE


cd /usr/share/nginx/html


unzip /tmp/web.zip &>> LOGFILE
echo "unzipped"

cp /root/shell_script_practice/components/roboshop.conf  /etc/nginx/default.d/roboshop.conf 
echo "copied"

systemctl restart nginx 
echo "resterted"
echo "$?"
 