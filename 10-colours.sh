#!/bin/bash

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

if [ $userid -ne 0 ]
then 
    echo -e "$r you are not root user $n"
    exit 1
else
    echo "preparing to start the installation"
fi

validate(){
    if [ $1 -eq 0 ]
    then 
        echo -e "$g installation of $2 success $n"
    else   
        echo -e "$r installation of $2 failed $n"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "package $y mysql already exist $n"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    dnf install python3 -y
    validate $? "python3"
else
    echo -e "package $y python3 already exist $n"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e "package $y nginx already exist $n"
fi