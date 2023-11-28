#!/bin/bash
#yum install nginx -y 
check $? "nginx"
check(){
if [ $1 -ne 0 ]
then
    echo -e "installation of $2 $R failre $N"
    exit 1
else
    echo -e "installation of $2 $G success $N"
    exit 1
fi
}
