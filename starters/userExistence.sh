#!/bin/bash

check_user(){
    id $1 &>> logfile
    if [ $? -ne 0 ]
then 
    useradd $1
    echo "user added"

else
    echo "already exits"
    exit 1
fi
}

user_existence= check renu