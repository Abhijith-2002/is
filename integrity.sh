#!/bin/bash

hash_file="hashes.txt"

create_hashes() {
    sha256sum * > "$hash_file"
}

check_hashes() {
    sha256sum -c "$hash_file"
}

case $1 in
    create) create_hashes ;;
    check) check_hashes ;;
esac