#!/bin/bash

list_files() {
    count=1
    for file in *;do
        if [ -f "$file" ];then
            creation_date=$(stat -c %w "$file")
            echo "$count. $file Created On : $creation_date"
            ((count++))
        fi
    done
}

check_user() {
    read -p "Enter username : " user
    while true;do
        if who | grep $user;then
            echo "$user has logged in"
            break
        else
            echo "$user not logged in, retrying in 30s..."
            sleep 30
        fi
    done
}

deny_exec() {
    read -p "Enter filename : " file
    if [ -f "$file" ];then
        chmod -x "$file"
        echo "Execution permission revoked !"
    fi
}

create_hashes() {
    hash_file="hash_file.txt"
    sha256sum * > "$hash_file"
    echo "Hash stored in $hash_file"
}

check_hashes() {
    hash_file="hash_file.txt"
    sha256sum -c "$hash_file"
}

read_files() {
    read -p "Enter filename : " file
    if [ -f "$file" ];then
        while read line;do
            echo "$line"
        done < "$file"
    fi
}

search_files() {
    read -p "Enter filename : " file
    if [ -f "$file" ];then
        read -p "Enter search word : " word
        grep "$word" "$file"
    fi
}

count_file() {
    read -p "Enter filename : " file
    if [ -f "$file" ];then
        lc=$(wc -l < "$file")
        wc=$(wc -w < "$file")
        cc=$(wc -c < "$file")
        echo "Line Count : $lc"
        echo "Word Count : $wc"
        echo "Char Count : $cc"
    fi
}

manipulate_file() {
    read -p "Enter filename : " file
    temp="temp.txt"
    if [ -f "$file" ];then
        if [ -f "$temp" ];then
            echo "To UpperCase"
            tr 'a-z' 'A-Z' < "$file" > "$temp"
        else
            touch "$temp"
            echo "To UpperCase"ls
            tr 'a-z' 'A-Z' < "$file" > "$temp"
        fi
    fi
}

replace_word() {
    read -p "Enter filename : " file
    if [ -f "$file" ];then
        read -p "Word to replace : " old
        read -p "New word : " new
        sed -i "s/$old/$new/g" "$file"
    fi
}

backup_file() {
    read -p "Enter filename : " file
    if [ -f "$file" ];then
        cp "$file" "$file.bak"
        echo "Backup created at $file.bak"
    fi
}

find_file() {
    read -p "Enter directory path : " dir
    read -p "Enter file name : " file
    find "$dir" -type f -name "$file"
}

create_users() {
    read -p "Enter user file name : " userfile
    while read username;do
        if cat /etc/passwd | grep "$username";then
            echo "$username already exists"
        else
            sudo useradd -m "$username"
            echo "$username created !"
        fi
    done < "$userfile"
}

case $1 in
    list) list_files ;;
    user) check_user ;;
    deny) deny_exec ;;
    create) create_hashes ;;
    check) check_hashes ;;
    read) read_files ;;
    search) search_files ;;
    count) count_file ;;
    manipulate) manipulate_file ;;
    replace) replace_word ;;
    backup) backup_file ;;
    find) find_file ;;
    users) create_users ;;
esac