#!/bin/bash

# Password Creator 

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 15/08/2022

# Gets the hash from the secret.txt file
secret=$(cat secret.txt)

# Ask's the user to type a secret password (input is hidden and times out within 30 seconds if there is no input)
read -sp "Type your password: " pass_var
echo

# Converts the users inputted password into a sha256 hash
passcheck=$pass_var | sha256sum

# Checks the hashed user inputted password against the hash contained in the secret.txt file

if [ "$passcheck" = "$secret" ]
then
    echo "Access Granted"
    exit 0
else
    echo "Access Denied"
    exit 1
fi
