#!/bin/bash

# Author: Jacinta Hayward
# Date Created: 19/08/2022
# Date modified: 19/08/2022

# Introduction text and instructions
echo "Welcome to the Guessing Game!"
echo "Please type a number between 1 and 100."

# Defining the variables
answer=42              # The chosen number that the player must guess
guess=0                # The number that is guessed by the player
num_guess=0            # Number of guesses made by the player

# Play game
while [ $guess -ne $answer ]; do            # If the guess is not equal to the answer variable, it will prompt the player to make a guess.
    echo -n "What is the number? " ; read guess
    if (( guess < answer )) ; then          # If the players guess is less than than the answer variable, then it will print "Higher"
    echo "...Higher!"
    elif (( guess > answer )) ; then        # If the players guess is greater than the answer variable, then it will print "Lower"
    echo "...Lower!"
    fi
    num_guess=$(($num_guess + 1))
done
echo -e "\033[32m CORRECT! You guessed $answer in $num_guess guesses."
exit 0