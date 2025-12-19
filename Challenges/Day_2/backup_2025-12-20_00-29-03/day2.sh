#!/bin/bash

echo "Welcome to Day 2!"
echo "Our current directory is: $PWD"

while true; do
    echo "Here are the files:"
    ls -la

    echo "Enter a line of text to count your characters (Press ENTER to exit):"; read count
    
    if [ -z "$count" ]; then
        echo "Exiting meowwww"
        exit
    fi

    char=$(echo -n $count | wc -m)
    echo "Character chount: $char"

done