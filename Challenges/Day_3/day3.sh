#!/bin/bash

# Function to create a user account
function create_user {
    read -p "Enter a new username: " username

    # Checking if the username exists
    if id "$username" &>/dev/null; then
        echo "Username '$username' already exists."
    else
        # asking for password
        read -p "Enter a password for the username: " password
        # adding username
        useradd -m -p "$password" "$username"
        echo "User "$username" added successfully."
    fi
}

# Function to delete a user account
function delete_user {
    read -p "Enter the username you would like to delete: " username

    # Checking if username exists
    if id "$username" &>/dev/null; then
            read -p "Are you sure you want to delete this user (Y/n): " confirmation
            if [ "$confirmation" = "n" ]||[ "$confirmation" = "N" ]; then
                echo "Deletion cancelled."
            else
                userdel $username 
            fi
    else 
        echo "User "$username" doesn't exist." 
    fi
}

# Function to reset password of a user.
function reset_pass {
    read -p "Enter the username you would like to delete: " username
    # Checking if username exists
    if id "$username" &>/dev/null; then
        read -p "Enter a new password for the user '$username': " password
        chpasswd <<<"$username":"$password"
    else
        echo "Error! Enter a valid username."
    fi
}

# Function to list every username.

function list_user {
    getent passwd | cut -d: -f1
}

# Function to list help page

function help_message {
    echo "Welcome to kyakei's day 3 script."
    echo "  Usage: $0 [OPTIONS]"
    echo "  -h, --help      Display this help message."
    echo "  -c, --create    Create a new user."
    echo "  -d, --delete    Delete a user."
    echo "  -r, --reset     Reset a user password."
    echo "  -l, --list      List all users."
}

function wrong_cmd {
    echo "          Wrong Command!"
    echo "  Usage: $0 [OPTIONS]"
    echo "  -h, --help      Display this help message."
    echo "  -c, --create    Create a new user."
    echo "  -d, --delete    Delete a user."
    echo "  -r, --reset     Reset a user password."
    echo "  -l, --list      List all users."
}

# Implementing flags

while [ $# -gt 0 ]; do
    case "$1" in
        -c|--create)
        create_user
        ;;
        -d|--delete)
        delete_user
        ;;
        -r|--reset)
        reset_pass
        ;;
        -l|--list)
        list_user
        ;;
        -h|--help)
        help_message
        ;;
        *)
        wrong_cmd
        ;;
    esac
    shift
done