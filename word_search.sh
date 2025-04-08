#!/bin/bash

read -p "Enter filename : " file
read -p "Enter word : " word

grep -n "$word" "$file"
