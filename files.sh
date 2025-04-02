#!/bin/bash
echo "Listing files with creation date and serial number"

count=1
for file in *; do
    if [ -f "$file" ]; then
        creation_date=$(stat -c %w "$file") 
        echo "$count. $file - Created on: $creation_date"
        ((count++))
    fi
done
