#!/bin/bash

read -p "Enter username : " user

while true;do
    if who | grep "$user";then
        echo "$user logged in"
        break
    else
        echo "$user not logged in, retrying in 30s"
        sleep 30
    fi 
done