#!/bin/bash

read -p "Enter file name : " file
read -p "Enter old word : " old
read -p "Enter new word : " new

if [ -f "$file" ];then
    sed -i '' s/"$old"/"$new"/g "$file"
    echo "Done !..."
    cat "$file"
fi