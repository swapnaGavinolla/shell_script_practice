#!/bin/bash

id () {
    id $1 &>> Logfile
    if [ $? -ne 0 ]
    then 
        useradd $1
        echo "hhh"
        echo "creating the $1 "
        
    # else
    #     echo "user $1  alrady exists"

    fi
} 

id hh