#!/bib/bash
# var_one=$1
# var_two=$2
# if [ $var_one -gt $var_two ]
# then  
#     echo "$var_one is greater than $var_two "
#     exit 1
# else
#     echo "$var_one is not greater than $var_two "
#     exit 1
# fi
user_id = $(id-u)
if [ $user_id -ne 0 ]
then 
    echo "get root user access"
    exit 1
else
    echo "go ahead"
fi


# yum install nginx -y 
# if [ $? ne 0 ]
# then
#     echo "nginx is not installed"
#     exit 1
# else
#     echo "nginx is not installed"
#     exit 1
# fi