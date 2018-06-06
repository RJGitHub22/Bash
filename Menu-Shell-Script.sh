#!/bin/bash
#Menu Shell Script
#Allows users to choose one or multiple items of the list
#Has controls if user chooses a number outside of range
#or chooses a noninteger

clear
echo
echo "Please select a menu item"
echo
echo "1. Display a list of files directories in your current directory"
echo "2. Display block device layout of system"
echo "3. Display the last 10 lines in /var/log/firewall"
echo "4. Display the System RAM memory info"
echo "5. Display the System CPU info"
echo "6. Exit the program"
echo
read CHOICE

#loop so someone can choose more than 1 number in program
until [ $CHOICE = 6 ]
do
#list of choices 1 through 5 with the corresponding commands
if [ $CHOICE = 1 ]
then
 ls
fi
if [ $CHOICE = 2 ]
then
 lsblk
fi
if [ $CHOICE = 3 ]
then
 cat /var/log/firewalld | tail
fi
if [ $CHOICE = 4 ]
then
 free -h | grep -v Swap
fi
if [ $CHOICE = 5 ]
then
 lscpu
fi
#if statement if user enters a noninteger
#send standard errors to /dev/null
if ! [ "$CHOICE" -eq "$CHOICE" ] 2> /dev/null
then
    echo "Please enter a NUMBER between 1 and 6"
fi
#if statement if user chooses the wrong number
#sends standard errors to /dev/null
if [ $CHOICE -lt 1 ] 2> /dev/null  || [ $CHOICE -gt 6 ] 2> /dev/null
then
 echo "Please choose a number between 1 and 6."
fi
echo
echo "Press ENTER to choose a new number"
#this command makes user press enter before continuing
read
clear
echo
#repeat of list to be within loop
echo "Please select a menu item"
echo
echo "1. Display a list of files directories in your current directory"
echo "2. Display block device layout of system"
echo "3. Display the last 10 lines in /var/log/firewall"
echo "4. Display the System RAM memory info"
echo "5. Display the System CPU info"
echo "6. Exit the program"
echo
#user enters new choice to go through loop again
read CHOICE

#end of loop
done
#program will go to here once user enters 6
echo
echo "You have exited the program. Have a nice day!"
