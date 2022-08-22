#!/bin/bash

# User Accounts

# Author: Jacinta Hayward
# Date Created: 20/08/2022
# Date modified: 22/08/2022

# Prints the introduction to the script in blue.
echo -e "\e[34m This script will display User Accounts\e[0m"

# Awk command to format into the categories. Colours are added to the table. 
# This command was based off of code from: 'Using AWK in Linux to Format Output' by The Urbanpenguin 02/03/2013 https://www.youtube.com/watch?v=fCw-xf31M_s&t=4s
awk -F ":" '
BEGIN { 
    print"\x1b[1;34m================================================================================"
printf "%-17s | %-5s | %-5s | %-20s | %-15s\n" , "Username", "UserID", "GroupID", "Home Directory", "Shell"
    print"\x1b[35m________________________________________________________________________________" 
}
NR=1,NR=10{ printf "%17s | %6d | %7d | %20s | %-20s\n", $1, $3, $4, $6, $7 }' /etc/passwd