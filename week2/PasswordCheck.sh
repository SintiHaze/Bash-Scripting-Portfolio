#!/bin/bash

# Password Creator 

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 16/08/2022

# Pulls the hashed password stored in secret.txt
get_sha256sum() {
    echo -n $1 | sha256sum | cut -f 1 -d ' '
}

# Gets the hash from the secret.txt file
secret_sha=$(cat secret.txt)

# Ask's the user to type a secret password (input is hidden and times out within 30 seconds if there is no input)
read -sp "Type your password: " pass_var
echo -e '\n'

# Checks the hashed user inputted password against the hash contained in the secret.txt file
if [ "$(get_sha256sum $pass_var)" = "$secret_sha" ]; then
    echo "Access Granted"
else
    echo "Access Denied"
fi