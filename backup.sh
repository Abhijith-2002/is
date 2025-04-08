#!/bin/bash

read -p "Enter file name : " file

if [ -f "$file" ];then
    cp "$file" "$file.bak"
    echo "Backup created at $file.bak"
fi