#!/bin/bash

# Folder Copier

# Date Created: 14/08/2022
# Date modified: 21/08/2022

#!/bin/bash

read -p "type the name of the folder you would like to copy: " folderName

# if the name is a valid directory

if [ -d "$folderName" ]; then

    # copy it to a new location

    read -p "type the name of the destination folder: " newFolderName

    cp -r "$folderName" "$newFolderName"

else

     # otherwise, print an error

    echo "I couldn't find that folder"

fi
					