#!/bin/bash

read -p "Enter filename : " file

line_count=$(wc -l < "$file")
word_count=$(wc -w < "$file")
char_count=$(wc -c < "$file")
echo "Line Count : $line_count"
echo "Word Count : $word_count"
echo "Char Count : $char_count"