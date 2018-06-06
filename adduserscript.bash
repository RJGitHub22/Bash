#!/bin/bash

# This script was used for my final project
# in my second Linux class
# It is used to create a user
# and put them in a Morning, Afternoon, or Night group

clear


echo "**********************************************"
echo "THIS SCRIPT ONLY WORKS WHILE LOGGED IN AS ROOT"
echo "**********************************************"
echo
echo
echo "You are about to create a new user"
echo
echo "Press ENTER to continue"
echo
read USER

#USER will not equal anything so it will enter the loop
until [ $USER = 2 ] 2> /dev/null
do


echo "Enter your new user's name"
echo
#Admin enters username here
read NAME
echo
#Echos name back so admin can verify correct name
echo "Your new user's name is" $NAME

#Menu to put new user into one of the groups
echo
echo "What group do you wish to add $NAME to:"
echo
echo "1) Morning (work 12AM-8AM)"
echo "2) Afternoon (work 8AM-4PM)"
echo "3) Night (work 4PM-12AM)"
echo "4) User does not need to be added to any of the groups"
echo
read CHOICE

echo


if [ $CHOICE = 1 ]
then
#Creates user, adds them to group, gives them a bash shell, and standard password of "qwerty"
 useradd $NAME -G morning -m -p $(echo "qwerty" | openssl passwd -1 -stdin) -s /bin/bash
  echo "$NAME has been added to the system and is in the morning group!"
fi

if [ $CHOICE = 2 ]
then
#Repeat for afternoon group
 useradd $NAME -G afternoon -m -p $(echo "qwerty" | openssl passwd -1 -stdin) -s /bin/bash
 echo "$NAME has been added to the system and is in the afternoon group!"
fi

if [ $CHOICE = 3 ]
then
#Repeat for night group
 useradd $NAME -G night -m -p $(echo "qwerty" | openssl passwd -1 -stdin) -s /bin/bash
 echo "$NAME has been added to the system and is in the night group!"
fi

if [ $CHOICE = 4 ]
then
#Here in case none of those groups is for new user
 useradd $NAME -m -p $(echo "qwerty" | openssl passwd -1 -stdin) -s /bin/bash
 echo "$NAME has been added to the system and was not added to any groups!"
fi

#if statement if admin enters a noninteger
#send standard errors to /dev/null
if ! [ "$CHOICE" -eq "$CHOICE" ] 2> /dev/null
then
    echo "You did not choose a number on the menu. User was not created."
fi
#if statement for when admin chooses the wrong number
#sends standard errors to /dev/null
if [ $CHOICE -lt 1 ] 2> /dev/null  || [ $CHOICE -gt 4 ] 2> /dev/null
then
 echo "You did not choose a number on the menu. User was not created."
fi

echo
echo "If you wish to continue making users enter "1" (or anything else) otherwise enter "2" to quit"
echo
read USER
echo

#If admin enters anything but 2, the script will continue; if they enter 2 it will end the loop and end the script

if [ $USER == 1 ]
then
 echo "User script will continue"
fi

if ! [ $USER  -lt 1 ] 2>/dev/null || [ $USER -gt 2 ] 2>/dev/null
then
 echo "User script will continue"
fi

if ! [ "$CHOICE" -eq "$CHOICE" ] 2> /dev/null
then
 echo "User script will continue"
fi

if [ $USER == 2 ]
then
 echo "User script will end"
fi


echo

done

echo
echo "Have a nice day!"
