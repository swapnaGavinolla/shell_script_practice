#!/bin/bash

id(){
    id nani 
    if [ $? -ne 0 ]
    then 
        useradd nani
        echo "added"
        exit 1
    fi
    echo "fjdgk"
}