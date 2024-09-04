#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
      echo "please run the script with root privileges"
      exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e $2 is ..$R "FAILED" $N
        exit 1
    else 
        echo -e $2 is ..$G "SUCCESS" $N
    fi

}

CHECK_ROOT

for package in $@
do
  
  dnf list installed $package
  if [ $? -ne 0 ]
  then 
     echo "$package is not installed, Going to install it."
    dnf install $package -y
    VALIDATE $? "Installing $package"
  else 
     echo "$package is Installed ... Nothing to do"
   fi


done