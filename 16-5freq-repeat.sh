#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Please enter the filename as input"
    exit 1
fi
FILE=$(cat "$1")
echo "${FILE}"

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
done <<< ${FILE}
