#!/bin/bash

read -p "Enter filename : " file

if [ -f "$file" ];then
    chmod -x "$file"
    echo "Execution permission denied to $file"
else 
    echo "File doesnt exist or not executable"
fi