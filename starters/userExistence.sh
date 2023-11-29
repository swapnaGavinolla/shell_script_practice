#!/bin/bash
id nani &>> Logfile
if ($? -ne 0)
then 
    echo "creating the user"
    useradd nani
    
else
    echo "user alrady exists"
    exit 1
fi