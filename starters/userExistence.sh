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

user_existence = (id nani)
echo "$user_existence"
# if [ $? -ne 0 ]
# then 
#     echo "user already exits"
#     exit 1
# else
#     useradd nami
#     echo "user nami is created"
# fi