#!/bin/bash

# Author: Jacinta Hayward
# Date Created: 19/08/2022
# Date modified: 19/08/2022

# Introduction text and instructions
echo "Welcome to the Guessing Game!"
echo "Please type a number between 1 and 100"

# Variables
answer=42              # The chosen number that the player must guess
guess=0                # The number that is guessed by the player
num_guess=0              # Number of guesses made by the player

# Play game
while [ $guess -ne $answer ]; do
    echo -n "What is the number? " ; read guess
    if (( guess < answer )) ; then
    echo "...Higher!"
    elif (( guess > answer )) ; then
    echo "...Lower!"
    fi
    num_guess=$(($num_guess + 1))
done
echo -e "\033[32m CORRECT! You guessed $answer in $num_guess guesses."
exit 0