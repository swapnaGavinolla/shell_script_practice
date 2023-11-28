!/bib/bash
R="\e[31m"
G="\e[32m"
N="\e[0m"
#var_one=$1
# var_two=$2
# if [ $var_one -gt $var_two ]
# then  
#     echo "$var_one is greater than $var_two "
#     exit 1
# else
#     echo "$var_one is not greater than $var_two "
#     exit 1
# fi
# user=$(id -u)
# if [ $user -ne 0 ]
# then 
#     echo "get root user access"
#     exit 1
# else
#     echo "go ahead"
# fi


yum install nginx -y 
if [ $? -ne 0 ]
then
    -e echo "nginx is not installed $R failre $N"
    exit 1
else
    -e echo "nginx is installed $G success $N"
    exit 1
fi