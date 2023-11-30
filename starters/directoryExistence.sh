#!/bin/bash

check_directory_existence (){
    cd $1 &>> LOGFILE
    if [ $? -ne 0 ]
    then
        mkdir $1
        echo "$1 directory is created"
        exit 1
    else
        echo "$1 directory already exists"
        exit 1
    fi
}

check_directory_existence ronnieee


 

   