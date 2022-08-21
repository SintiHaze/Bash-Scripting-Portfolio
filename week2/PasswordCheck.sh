#!/bin/bash

# Password Creator 

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 21/08/2022

# Pulls the hashed password stored in secret.txt
get_sha256sum() {
    echo -n $1 | sha256sum | cut -f 1 -d ' ' # cuts the endspace off of the hashed password that the user inputs
}

# Gets the hash from the secret.txt file
secret_sha=$(cat secret.txt)

# Ask's the user to type a secret password (input is hidden and times out within 30 seconds if there is no input)
# (Security feature) Time's out and reflects 'Access Denied' within 30 seconds if the user has not input their password in that timeframe. 
read -t30 -sp "Type your password: " pass_var
echo -e '\n'

# Checks the hashed user inputted password against the hash contained in the secret.txt file
if [ "$(get_sha256sum $pass_var)" = "$secret_sha" ]; then
    echo "Access Granted"
    exit 0
else
    echo "Access Denied"
    exit 1
fi