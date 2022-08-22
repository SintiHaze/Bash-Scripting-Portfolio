#!/bin/bash

# Mega Menu

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 22/08/2022

# Introduces the script in light blue
echo -e "\x1b[1;34mWelcome to the MegaMenu!"

# The PS3 variable is used to request input for which option the user would like to select.  
PS3="Enter a number to select an option: "

# Provides the menu options that the user can choose from with the case statement. The options are listed from 1-8.
menu_choice=("Create folder" "Copy folder" "Set password" "Calculator" "Create week folders" "Check filenames" "Download a file" "Exit")
select option in "${menu_choice[@]}"; do
    case $option in
        "Create folder")
            sh ./foldermaker.sh
            echo -e "\033[0;34m' A folder will be created"
            ;;
        "Copy folder" )
            sh ./folderCopier.sh
            ;;
        "Set password" )
            sh ./setPassword.sh
            ;;
        
        "Calculator" )
            sh ./Calculator.sh
            ;;
        
        "Create week folders" )
            sh ./foldermaker.sh
            ;;
        
        "Check filenames" )
            sh ./downloader.sh
            ;;
        
        "Download a file" )
            sh ./filenames.sh
            ;;
        
        "Exit" )
            echo -e "\033[0;35m' Goodbye!"
            exit
            ;;
        *) echo -e "\033[41m' invalid option".;; # If the user inputs a character other than 1-8. it will prompt them to enter an option again and display 'Invalid option'.
    esac
done



