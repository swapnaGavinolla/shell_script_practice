#!/bin/bash

id () {
    id $1 &>> Logfile
    if [ $? -ne 0 ]
    then 
        useradd nani
        echo "creating the $1 "
        
    else
        echo "user $1  alrady exists"

    fi
} 

id nani "chooopu"