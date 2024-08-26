#!/bin/bash

USERID=$(id -u)
if [ ${USERID} -ne 0 ]
then
    echo "Please run the script with sudo previleges"
    exit 1
fi

dnf list installed  mysql 

if [ $? -ne 0 ]
then
    echo "my sql was not installed, going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then 
        echo "mysql was installed successfully"
    fi
else
    echo "package was already installed"
    exit 1
fi
