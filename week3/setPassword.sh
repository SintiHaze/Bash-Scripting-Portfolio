#!/bin/bash

# Author: Jacinta Hayward
# Date created: 14/08/2022
# Date modified: 19/08/2022

# ask the user to type a folder name

# Asks the user to input their password (input is hidden). Time's out after 30 seconds if user has not input a password. 
read -t30 -sp "Please enter your password" pass_var

# save the user’s password in a file called 'secret.txt' inside the folder the user chose.
echo $pass_var > secret.txt

echo "Your password has successfully been set."
