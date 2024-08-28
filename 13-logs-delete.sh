#!/bin/bash

##### delete the logs in logs folder morethan 2 weeks.

LOGS_DIR=/var/log
if [ -d ${LOGS_DIR} ]
then    
    echo "Source directory exists"
else    
    echo "source directory doesn't exist"
    exit 1
fi

Log_Files=$( find ${LOGS_DIR} -name "*.log"  )
echo "${Log_Files}"

while IFS= read -r line 
do
    echo "delete file: ${line}"
done <<< ${Log_Files}