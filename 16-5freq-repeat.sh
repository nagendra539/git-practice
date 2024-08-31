#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Please enter the filename as input"
    exit 1
fi

if [ -f $1 ]
then    
    echo "File exists"
else
    echo "File not exists, Please enter the exact file name"
    exit 1
fi
FILE=$(cat "$1")

while IFS= read -r line
do  
    occu=$(echo "$line" | tr ' ' '\n' | sort | uniq -c | sort -nr | head -n5)
    echo "${occu}"
done <<< $FILE
