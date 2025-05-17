#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "you are not root user"
else
    echo "preparing to start the installation"
fi

dnf install mysql -y