#!/bin/bash

# Guessing Game

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 16/08/2022

#This function prints a given error

printCorrect()

{

    echo -e "\033[32mCORRECT! \033[0m $1"

}

printError()

{

    echo -e "\033[31m Too Low! \033[0m $1"

}



#This function will get a value between the 2nd and 3rd arguments

getNumber()

{

    read -p "$1: "

    while (( $REPLY > $2 || $REPLY < $3 )); do

        printCorrect

        read -p "$1: "

    done

    while (( $REPLY < $2 || $REPLY > $3 )); do

        printError "Input must be between $2 and $3"

        read -p "$1: "

    done

}



echo "Welcome to the Guessing Game!"

getNumber "Please type a number between 1 and 100" 1 100

