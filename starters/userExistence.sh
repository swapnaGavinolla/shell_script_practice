#!/bin/bash

id () {
    id nani &>> Logfile
    if [ $? -ne 0 ]
    then 
        echo "creating the $1 "
        useradd nani
        
    else
        echo "user alrady exists"
    fi
} 

id nani "nani"