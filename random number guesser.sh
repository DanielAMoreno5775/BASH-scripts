#!/usr/bin/env bash

#Generate the random number
randNum=$((RANDOM % 10 + 1))

askForUserGuess(){
	#get user guess
	read -p "Enter a number between 1 and 10: " userGuess
	
	if [ "$1" == "$userGuess" ]; then
		return 1
	else
		return 0
	fi
}


while askForUserGuess "$randNum" ; do 
	echo "Sorry, you are not correct. Try again!";
done

echo "Congratulations, the number is $randNum."
