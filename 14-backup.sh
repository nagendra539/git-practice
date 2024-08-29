#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if $3 is empty, default is 14 

USAGE(){
    echo "USAGE: sh 14-backup.sh <source-dir> <dest-dir> <no.of days>"
}

# Check the source and destinations are provided
if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi  

LOGS= $(find $1 -name "*.log" -mtime $3)