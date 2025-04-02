#!/bin/bash

read -p "Enter username : " user

while true; do
    if who | grep "$user"; then
        echo "User $user has logged in!"
        break
    else 
        echo "retrying in 30s..."
        sleep 30
    fi
done