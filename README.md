# BASH-scripts

## Angle Converter Gawk Script
Reads in text in the following format but only if the target file starts with the word "Degrees" and converts the angle to the range of 0, 360 (inclusive, exclusive)
Degrees
135
90
1170

## Execute User Input as Command Shell Script
Gets the user's input and executes it as a command

## Single-line Gawk
Gawk command to print out employees that earned over 50k in 2019

## Phone Number Encrypter Sed Script
Converts (866) 879-7647 and similar phone numbers into FSSFDGDStD and appends 10 characters from my name after the third phone number in the file

## Random Number Guessing Game Shell Script
Basic game that generates a random number and allows the user to guess it

## Single-line Palindrome Detector Sed Command
A sed command that prints 6-character palindromes

## User Tracker Shell Script
This program will first print out a list of all users logged into the current machine in the format of ">abc0123 logged in to home-comp". Then, the program will execute a loop every 10 seconds until the program is interrupted. The loop will print out the number of currently logged in users along with the usernames of anyone that has logged in or out since the last iteration. If the user attempts to interrupt the program by sending the Ctrl+C (SIGINT) signal, the first attempt will be suppressed while the second attempt will sucessfully interrupt the program. This program assumes that each unique user will only be logged in once.