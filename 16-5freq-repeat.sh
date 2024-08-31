#!/bin/bash

FILE=$1
if [ $# -lt 1 ]
then
    echo "Please enter the filename as input"
    exit 1
fi
if [ -f $FILE ]
then    
    echo "File exists"
else
    echo "File not exists, Please enter the exact file name"
    exit 1
fi

while IFS= read -r line
do  
    echo "$line"
done <<< "$FILE"
