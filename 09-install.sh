#!/bin/bash

USERID=$(id -u)

# "echo Userid is: $USERID"

if [ $USERID -ne 0 ]
then
   echo "please run the script with root previleges"
   exit1
fi



