#!/usr/bin/python3
 
# Brute Force

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 17/08/2022

# Imports tha random function
import random

# Sets the different characters that can be used in the inputted password. Includes letters, numbers and special characters which take makes the password longer to crack.
character = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789`~!@#$%^&*()_-+=[{]}|:;'\",<.>/? "
characterList = list(character)

# Asks the user to input a password
password = input("\033[1;32m Please enter your password: ")
guess = ""
while (guess != password):
    guess = random.choices(characterList,k=len(password)) # The random function allows the system to generate random characters as a way to guess the password.
    guess = "".join(guess)

# Displays an ASCII image
print("""\
 ___________________________________ 
|  _______________________________  |
| | PASSWORD SUCCESSFULLY CRACKED | |
| |_______________________________| |
|___________________________________|
    """)

# Displays the password that was cracked by this code. 
print("\033[1;32m Your password is: " + guess)