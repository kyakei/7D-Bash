#!/bin/bash

# I will update it when I am done with the script

# meow
echo "meow"

# meowwrrrraooooo
variable1=meoww
variable2=rrrraooooo

# hehe 67
meow="$variable1$variable2"
variable3=35
variable4=32

# hehe actual 67 because 35+32
add=$(( variable3 + variable4 ))
echo $add, $meow

# Using built in variables
echo "my name is $USER, the script name is $0, and i am using $SHELL to execute this script."

# Listing every .pdf in my assignment folder
echo "this is my hardwork ;-; :"
ls /home/kyakei/Desktop/assignments/**/*.pdf
