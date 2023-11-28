#!/bib/bash
var_one=$1
var_two=$2
var_sum=$((var_one+var_two))
echo "the sum of the given two numbers : $var_sum"
if[ $var_one -gt $var_two]
then  
    echo "$var_one is greater than $var_two "
    exit 1
else
    echo "$var_one is not greater than $var_two "
    exit 1
fi