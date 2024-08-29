#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 
DATE=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE: sh 14-backup.sh <source-dir> <dest-dir> <no.of days>"
}

# Check the source and destinations are provided
if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi  

if [ ! -d $SOURCE_DIR ]
then
    echo "source directory is not present"
    exit 1
fi
if [ ! -d $DEST_DIR ]
then
    echo "Destination directory is not present"
    exit 1
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +${DAYS})
echo "Files are : $FILES"

find ${SOURCE_DIR} -name "*.log" -mtime +${DAYS} | zip ${DEST_DIR}/${DATE}.zip -@

# if [ ! -z $FILES ]
# then
#     echo "files are present: $FILES"
#     find ${SOURCE_DIR} -name "*.log" -mtime +${DAYS} | zip ${DEST_DIR}/${DATE}.zip -@
# else    
#     echo "files are not there in ${SOURCE_DIR} older than ${DAYS}"
#     exit 1
# fi