#!/bin/bash

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"
logs_folder="var/log/shellscript-logs"
script_name=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$script_name.log"
packages=("mysql" "nginx" "python3" "httpd")

mkdir -p $logs_folder
echo "script started executing at $(date)" | tee -a $log_file

if [ $userid -ne 0 ]
then 
    echo -e "$r you are not root user $n" | tee -a $log_file
    exit 1
else
    echo "preparing to start the installation" | tee -a $log_file
fi

validate(){
    if [ $1 -eq 0 ]
    then 
        echo -e "$g installation of $2 success $n" | tee -a $log_file
    else   
        echo -e "$r installation of $2 failed $n" | tee -a $log_file
        exit 1
    fi
}

for package in ${packages[@]}
#for package in $@
do 
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]
    then 
        dnf install $package -y &>>$log_file
        validate $? "$package"
    else
        echo -e "package $y $package already exist $n" | tee -a $log_file
    fi

done