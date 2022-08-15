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

# save the user’s password in a file called 'secret.txt' inside the folder the user chose.

# Turn the password into a hash
echo SECRET_PASSWORD | sha256sum
echo SECRET_PASSWORD >> secret.txt
echo "This is a hash of your password."