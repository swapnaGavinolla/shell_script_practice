#!/bin/bash

# id(){
#     id fg
#     if [ $? -ne 0 ]
#     then 
#         useradd nani
#         echo "added"
#         exit 1
#     else
#         echo "user already exists"
#     fi
#     echo "fjdgk"
# }

id nani >> logfile
if [ $? -ne 0 ]
then 
    echo "already exits"
    exit 1
fi