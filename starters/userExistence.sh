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

id nanu >> logfile
id(){
    if [ $? -ne 0 ]
then 
    useradd $1
    echo "user added"

else
    echo "already exits"
    exit 1
fi
}
