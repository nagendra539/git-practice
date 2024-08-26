#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
N="\e[0m"


if [ ${USERID} -ne 0 ]
then
    echo -e "Please run the script with ${RED} sudo previleges ${N}"
    exit 1
fi

VERIFY()
{
    if [ ${1} -ne 0 ]
    then 
        echo "installtion failed..."
        exit 1
    else    
        echo -e "installation of ${GREEN} ${2} passed ${N}"
    fi
}

dnf list installed  mysql 

if [ $? -ne 0 ]
then
    echo "my sql was not installed, going to install it"
    dnf install mysql -y
    VERIFY $? mysql
    
else
    echo -e "package was already ${GREEN}installed ${N}"
    exit 1
fi
