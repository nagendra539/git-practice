#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)

while IFS= read -r line
do
    LINE1=$(echo "$line" | awk -F " " '{print $1F}')
    LINE2=$(echo "$line" | awk -F " " '{print $6F}')
    echo "$LINE1 : $LINE2"
done <<< $DISK_USAGE