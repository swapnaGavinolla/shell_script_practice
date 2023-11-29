#!/bin/bash

id(){
    if [ (id nani) -ne 0]
    then 
        useradd nani
        echo "added"
        exit 1
    fi
    echo "fjdgk"
}