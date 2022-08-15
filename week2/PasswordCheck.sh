#!/bin/bash

# Password Creator 

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 14/08/2022

# ask the user to type a folder name
read -p "Type the name of the folder you would like to create: " folderName

# Creates a folder with the name provided by the user
mkdir -p $folderName

# ask the user to type a secret password (hide that input)
read -sp "Type your password: " pass_var
echo 
# Turn the password into a hash
echo $pass_var | sha256sum
echo $pass_var | sha256sum > secret.txt

# save the user’s password in a file called 'secret.txt' 
echo
echo "This is a hash of your password."

# Moves the secret.txt file to inside the folder the user chose.
mv secret.txt $folderName
