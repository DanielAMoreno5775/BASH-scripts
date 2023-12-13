#!/bin/bash

#This program will first print out a list of all users logged into the current machine in the format of ">abc0123 logged in to cell05-cse"
#Then, the program will execute a loop every 10 seconds until the program is interrupted
#The loop will print out the number of currently logged in users along with the usernames of anyone that has logged in or out since the last iteration
#If the user attempts to interrupt the program by sending the Ctrl+C (SIGINT) signal, the first attempt will be suppressed while the second attempt will sucessfully interrupt the program
#This program assumes that each unique user will only be logged in once


#code to prevent first usage of Ctrl+C
trap 'suppressOnce' 2
suppressOnce() {
	echo -e "  (SIGINT) ignored. enter ^C 1 more time to terminate program.\n"
	trap 2 # reset it (may not always work)
}

#print initial line
echo "`date`) initial users logged in"

#Get the usernames of all logged in users by printing out list of all users (without the header), and then using gawk to only get the first line
currentListOfUsers=($(w -h | gawk '{ print $1 }'))
#Get the name of the current machine
machineName=($(hostname))
#Print out list of all logged in users
for i in "${currentListOfUsers[@]}"
do
  echo -e ">$i logged in to $machineName\n"
done


#Count the number of users currently online by getting the usernames and counting the unique ones
numOfUsers=($(w -h | gawk '{ print $1 }' | sort | uniq | wc -l))

#execute the loop forever until it is interrupted
while true
do
	#store the current list in a separate array and refresh the current list
	pastListOfUsers=("${currentListOfUsers[@]}")
	currentListOfUsers=($(w -h | gawk '{ print $1 }'))
	#compare the two arrays and store the asymmetrical difference in two array variables (past - current AND current - past)
	listOfLogIns=(`echo ${pastListOfUsers[@]} ${pastListOfUsers[@]} ${currentListOfUsers[@]} | tr ' ' '\n' | sort | uniq -u `)
	listOfLogOuts=(`echo ${currentListOfUsers[@]} ${currentListOfUsers[@]} ${pastListOfUsers[@]} | tr ' ' '\n' | sort | uniq -u `)
	#print out the logins
	for loginEntry in "${listOfLogIns[@]}"
	do
	  echo -e ">$loginEntry logged in to $machineName\n"
	done
	#print out the logouts
	for logoutEntry in "${listOfLogOuts[@]}"
	do
	  echo -e ">$logoutEntry logged out of $machineName\n"
	done

	#get current number of users and print it on a timestamped line
	numOfUsers=($(w -h | gawk '{ print $1 }' | sort | uniq | wc -l))
	echo -e "`date`) # of users: $numOfUsers\n"
	
	#sleep for 10 seconds before executing the loop again
	sleep 10
done
