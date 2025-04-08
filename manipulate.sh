#!/bin/bash

read -p "Enter filename : " file

if [ -f "$file" ];then
    echo "To Uppercase : "
    cat "$file" | tr 'a-z' 'A-Z'
fi