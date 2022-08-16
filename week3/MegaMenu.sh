#!/bin/bash

# Mega Menu

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 16/08/2022

# Color  Variables
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
red='\e[31'

# Color Functions
ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

# The PS3 variable is used to request input for which option the user would like to select.  

PS3="Enter a number to select an option: "
menu_choice=("Create folder" "Copy folder" "Set password" "Calculator" "Create week folders" "Check filenames" "Download a file" "Exit")
select option in "${menu_choice[@]}"; do
    case $option in
        "Create folder")
            sh ./CreateFolder.sh
            echo "A folder will be created"
            # call a function to bring up the script that does this.
            ;;
        "Copy folder" )
            sh ./CopyFolder.sh
            echo "A folder will be copied" 
            # call a function to bring up the script that does this.
            ;;
        "Set password" )
            sh ./SetPassword.sh
            echo "Your password will be set"
            # call a function to bring up the script that does this.
            ;;
        
        "Calculator" )
            sh ./Calculator.sh
            echo "Your password will be set"
            # call a function to bring up the script that does this.
            ;;
        
        "Create week folders" )
            echo "Your password will be set"
            # call a function to bring up the script that does this.
            ;;
        
        "Check filenames" )
            echo "Your password will be set"
            # call a function to bring up the script that does this.
            ;;
        
        "Download a file" )
            echo "Your password will be set"
            # call a function to bring up the script that does this.
            ;;
        
        "Exit" )
            echo "User requested exit"
            exit
            ;;
        *) echo "invalid option".;;
    esac
done



