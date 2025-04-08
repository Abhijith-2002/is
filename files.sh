#!/bin/bash

echo "Printing files with serial number and creation date"

count=1
for file in *;do
    if [ -f "$file" ];then
        creation_date=$(stat -f %B "$file")
        echo "$count. $file - Created On : $creation_date"
        ((count++))
    fi 
done