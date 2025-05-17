#!/bin/bash
 echo "variables passed : $@"
 echo " total no of variables : $#"
 echo "name of the script:$0"
 echo "current working dirctry :$PWD"
 echo "current user : $USER"
 echo "PID of current script :$$"
 sleep 10 &
 echo "PID of last command ran : $!"