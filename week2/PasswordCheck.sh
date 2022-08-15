#!/bin/bash

# Password Creator 

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 15/08/2022

# Ask's the user to type a folder name
read -p "Type the name of the folder you would like to create: " folderName

# Creates a folder with the name provided by the user
mkdir -p $folderName

# Ask's the user to type a secret password (hide that input)
read -sp "Type your password: " pass_var
echo

# Turn the password into a hash and then saves it to a secret.txt file. 
echo $pass_var | sha256sum > secret.txt

# Save's the user’s password in a file called 'secret.txt' 
echo
echo "Your password has been saved in an encrypted form."

# Moves the secret.txt file to inside the folder name that the user chose and was created.
mv secret.txt $folderName
