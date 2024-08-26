#!/bin/bash

DATE=$(date)
echo "${DATE}"

NUMBER1=$1
NUMBER2=$2

SUM=$((${NUMBER1}+${NUMBER2}))
echo "${SUM}"

echo "all variables passed to the script: $@"
echo "Number of varibales passed to the script: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "current process  ID of the script: $$"
sleep 100 &
echo "PID of the last beckground process: $!"