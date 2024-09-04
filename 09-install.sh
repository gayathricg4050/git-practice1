#!/bin/bash

USERID=$(id -u)

# "echo Userid is: $USERID"

if [ $USERID -ne 0 ]
then
   echo "please run the script with root previleges"
   exit 1
fi
dnf list installed git

if [ $? -ne 0 ]
then
   echo git is not installed, going to install
   dnf install git -y
else
    echo git is installed, nothing to do
fi



