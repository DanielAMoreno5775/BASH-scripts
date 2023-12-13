#!/usr/bin/env bash

#prompt the user
#then, read in the user's input as an array
read -p "Enter Linux command to perform: " -a usrCmd
#print out what the user inputted
echo "Command to be executed: ${usrCmd[@]}"

# expand the array, run the command
"${usrCmd[@]}"
