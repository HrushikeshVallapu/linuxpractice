#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "you are not root user"
    exit 1
else
    echo "preparing to start the installation"
fi

validate(){
    if [ $1 -eq 0 ]
    then 
        echo "installation of $2 success"
    else   
        echo "installation of $2 failed"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    validate $? "mysql"
else
    echo "package  mysql already exist"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    dnf install python3 -y
    validate $? "python3"
else
    echo "package python3 already exist"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    validate $? "nginx"
else
    echo "package nginx already exist"
fi