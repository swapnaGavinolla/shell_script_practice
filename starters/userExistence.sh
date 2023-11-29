#!/bin/bash

id () {
    id nani &>> Logfile
    if [ $? -ne 0 ]
    then 
        
        useradd nani
        echo "creating the $1 "
        exit 1
        
    else
        echo "user $1  alrady exists"
        exit 1
    fi
} 

id nani "nani"