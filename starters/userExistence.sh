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

user_existence= id nani &>> Logfile
if [ $user_existence -ne 0 ]
then 
    echo "user already exits"
else
    useradd nani
    echo "user nani is created"
fi