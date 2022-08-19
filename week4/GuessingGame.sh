#!/bin/bash

# Guessing Game

# Author: Jacinta Hayward
# Date Created: 19/08/2022
# Date modified: 19/08/2022

# Introduction text and instructions
echo "Welcome to the Guessing Game!"
echo -e "\nPlease type a number between 1 and 100."

# Defining the variables
answer=42              # The chosen number that the player must guess
guess=0                # The number that is guessed by the player
num_guess=0            # Number of guesses made by the player

# Play game
while [ $guess -ne $answer ]; do            # If the guess is not equal to the answer variable, it will prompt the player to make a guess.
    echo -n "What is the number? " ; read guess
    if (( guess < answer )) ; then          # If the players guess is less than than the answer variable, then it will print "Higher"
    echo "...Too Low!"
    elif (( guess > answer )) ; then        # If the players guess is greater than the answer variable, then it will print "Lower"
    echo "...Too High!"
    fi
    num_guess=$(($num_guess + 1))           # Keeps track of the number of guesses made by the player.
done

# Displays text to say that the player has successfully guessed the number and displays how many guesses were made. 
echo -e "\033[32m CORRECT! You guessed $answer in $num_guess guesses."

# Save your score to a text file with amount of guesses and the name of the player. 
read -p "Please enter your name: " name
echo $num_guess $name  >> scores.txt 

# Prints and sorts list of scores that are saved in the text file from lowest to highest amount of guesses. 
echo -e "\033[94m \nPrevious scores: " 
sort -n scores.txt

# Prints the player with the least amount of guesses.
echo -e "\nThe top player is: "
sort -n scores.txt | head -1

exit 0