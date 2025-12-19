#!/bin/bash

# Function usage
function usage {
    echo "Usage: $0 /path/to/valid/dir"
}

# logic to check if there is an arguement or the directory is valid or not.
if [ $# -eq 0 ] || [ ! -d "$1" ]; then
    echo "Provide a valid directory."
    usage
    exit
fi

# logic to check if the file name starts with backup_"
for i in "$1"/*; do
    if [[ $(basename "$i") == backup_* ]]; then
      continue
    fi

    echo "Copying $(basename "$i")"
done

#timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
#creating backup
backup="$1/backup_$timestamp"
mkdir "$backup"

# logic to copy all the files in the backup
for i in "$1"/*; do
    if [[ $(basename "$i") == backup_* ]]; then
      continue
    fi

cp -r "$i" "$backup"
done

backups=( "$1"/backup_* )
count=${#backups[@]}

if [ "$count" -gt 3 ]; then
    delete=$((count - 3))
    echo "$delete" directories detected.

    for ((i=0; i<delete; i++)); do
        echo "Deleteing $(basename "${backups[i]}")"
        rm -rf "${backups[i]}"
    done
fi