#!/bin/bash

id(){
    id fg
    if [ $? -ne 0 ]
    then 
        useradd nani
        echo "added"
        exit 1
    fi
    echo "fjdgk"
}