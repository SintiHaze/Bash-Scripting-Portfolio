#!/bin/bash

# Password Creator 

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 14/08/2022

# ask the user to type a folder name
echo "Type a folder name"
read -p "Type the name of the folder you would like to create: " folderName

# ask the user to type a secret password (hide that input)
read -sp "Type your password: " 

# Turn the password into a hash
echo 
echo $password | sha256sum

# save the user’s password in a file called 'secret.txt' 
echo password >> secret.txt

# Moves the secret.txt file to inside the folder the user chose.
mv secret.txt folerName

echo "This is a hash of your password."