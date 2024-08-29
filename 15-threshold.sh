#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
USAGE=5

while IFS= read -r line
do
    PARTITION=$(echo "$line" | awk -F " " '{print $NF}') #$NF: get the last column
    UTILIZATION=$(echo "$line" | awk -F " " '{print $6F}' | cut -d "%" -f1)
    if [ $UTILIZATION -ge $USAGE ]
    then
        echo "$PARTITION : $UTILIZATION"
    fi
done <<< $DISK_USAGE