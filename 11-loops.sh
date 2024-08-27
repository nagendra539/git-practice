#!/bin/bash
USER=$(id -u)
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
N="\e[0m"
CHECKROOT(){
    if [ $USER -ne 0 ]
    then
        echo -e "please run this suite with ${RED}root user ${N}"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo -e "$2 is not installed, Please check the error"
        exit 1
    fi
}

#
for package in $@ #it will pass all the arguements  to this loop
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e "$package is not installed, going to install it"
        dnf install $package -y
        VALIDATE $? $package
    else
        echo -e "$package is already installed"
    fi

done
