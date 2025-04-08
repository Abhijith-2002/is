#!/bin/bash

read -p "Enter directory name : " dir
read -p "Enter file name : " file

find "$dir" -type f -name "$file"
