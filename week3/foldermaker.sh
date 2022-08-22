#!/bin/bash
# Foldermaker
# Date Created: 16/08/2022
# Date modified: 21/08/2022

# Asks the user to input the name of a folder.
read -p "Type the name of the folder you would like to create: " folderName

# Creates a new folder using the input from the user.
mkdir "$folderName"

# Creates output to confirm that the folder has been created. 
echo "A folder named $folderName has been created."

exit 0