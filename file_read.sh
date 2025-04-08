#!/bin/bash

read -p "Enter filename : " file

if [ -f "$file" ];then
    while IFS= read -r line;do
        echo "$line"
    done < "$file"
else 
    echo "$file not found !"
fi