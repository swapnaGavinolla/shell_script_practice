#!/bin/bash
read a= $1
read b=$2
if (a -gt b)
    echo "$a is greater than $b"
    exit1
else
     echo "$a is greater than $b"
     exit1
fi