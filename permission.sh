#!/bin/bash

read -p "Enter filename to deny execution: " filename

if [ -f "$filename" ]; then
    chmod -x "$filename"
    echo "Execution denied for $filename"
fi