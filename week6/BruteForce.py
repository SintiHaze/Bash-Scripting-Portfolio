#!/usr/bin/python3
# Brute Force

# Author: Jacinta Hayward
# Date Created: 14/08/2022
# Date modified: 22/08/2022

print("""\

█▓▒▒░░░BRUTEFORCE░░░▒▒▓█

    """)

# Imports the random and time functions
import random
import time

# Sets the different characters that can be used in the inputted password.
character = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
characterList = list(character)

# Asks the user to input a password
password = input("\033[1;92m Please enter your password: ")

# Uses the time function to count the seconds elapsed whilst the password guesses are generated. 
startTime = time.time() 
guess = ""
while (guess != password):
    guess = random.choices(characterList, k=len(password))  # The random function allows the system to generate random characters to guess the password.
    guess = "". join(guess)
    endTime = time.time()
    elapsedTime = endTime - startTime

# Displays an ASCII image
print("""\
 ___________________________________
|  _______________________________  |
| | PASSWORD SUCCESSFULLY CRACKED | |
| |_______________________________| |
|___________________________________|
    """)

# Displays the password that was cracked by this code.
print("\033[1;96m Your password is: " + guess)
print("\033[1;94m That took", elapsedTime, "seconds to crack!")
