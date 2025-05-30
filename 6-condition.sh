#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "you are not root user"
    exit 1
else
    echo "preparing to start the installation"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then 
    echo "installation success"
else   
    echo "installation failed"
    exit 1
fi