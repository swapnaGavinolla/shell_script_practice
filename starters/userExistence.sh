#!/bin/bash

check_user(){
    id $1 &>> logfile
    if [ $? -ne 0 ]
then 
    useradd $1
    echo "user $1 added"

else
    echo " $1 already exits"
    exit 1
fi
}
check_user kanna