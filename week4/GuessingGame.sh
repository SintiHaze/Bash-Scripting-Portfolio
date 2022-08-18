#!/bin/bash

# Guessing Game

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 16/08/2022

#This function prints when the answer is correct

printCorrect()

{

    echo -e "\033[32mCORRECT! \033[0m $1"

}

# This function prints when the answer is incorrect.

printError()

{

    echo -e "\033[31m Too Low! \033[0m $1"

}



# This function will get a value between the 2nd and 3rd arguments

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

# Introduction text and instructions

echo "Welcome to the Guessing Game!"

getNumber "Please type a number between 1 and 100" 1 100

