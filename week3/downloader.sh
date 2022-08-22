#!/bin/bash

# Downloader

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 21/08/2022

# Prompts the user to type a website URL to download or type “exit” to quit.”
read -p "Type a URL to download a file or type 'exit' to quit: " input

if [[ $input = exit ]]; then 
    echo "Exiting the script."
    exit 0
else
    read -p "Type a location to save the download to:  " location
    read -p "Type the name you would like to call this file:  " name
    curl -O $input > $name.png # Downloads the webpage requested by the user and saves the download as the name chosen by the user. 
fi

# Repeat the process until the user types “exit”.