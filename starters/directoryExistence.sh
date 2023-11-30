#!/bin/bash

directory_existence (){
    cd shh &>> LOGFILE
    if [ $? -ne 0 ]
    then
        mkdir $1
        echo "$1 directory is created"
        exit 1
    else
        echo "$1 directory already exists"
        exit1
    fi
}


 

   