#!/usr/bin/python3
 
# Brute Force

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 17/08/2022

# Imports tha random function
import random

# Sets the different characters that can be used in the inputted password
character = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
characterList = list(character)

# Asks the user to input a password
password = input("\033[1;32m Please enter your password: ")
guess = ""
while (guess != password):
    guess = random.choices(characterList,k=len(password))
    guess = "".join(guess) 
print("\033[1;32m Your password is: " + guess)

# Displays an ASCII image
print("""\
 ___________________________________ 
|  _______________________________  |
| | PASSWORD SUCCESSFULLY CRACKED | |
| |_______________________________| |
|___________________________________|
    """)