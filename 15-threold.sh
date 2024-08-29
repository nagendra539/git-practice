#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)

while IFS= read -r line
do
    echo "$line" | awk -F " " '{print $6F}'
done