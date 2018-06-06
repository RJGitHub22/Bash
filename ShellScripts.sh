#!/bin/bash

# These are a list scripts written for my first Linux class

clear
echo
echo "**Script 1"
echo "Your currenty directory is..."
pwd
echo "You're changing to your parent directory, which is..."
cd
pwd
echo "You're changing back to the scripts directory."
cd ~/scripts
echo "Here is a listing of your files and directories:"
ls -l


clear
echo
echo "**Script 2"
STARTLOCATION=$HOME
FILENAME=script1.bash
echo "Searching for the file named $FILENAME"
echo "in the $STARTLOCATION directory"
find $STARTLOCATION -name $FILENAME



clear
echo
echo "**Script 5"
echo "Welcome to the FIND script"
echo -n "Enter the location (such as /home) where the search should start "
read STARTLOCATION
echo -n "What is the name of the file to search for? "
read FILENAME
echo "Search starting for the $FILENAME file in the $STARTLOCATION directory"
find $STARTLOCATION -name $FILENAME 2>/dev/null



clear
echo
echo "**Script 4"
echo "Searching for $2 starting in the $1 directory"
find $1 -name $2 2>/dev/null



clear
echo
echo "**Script 5"
echo "Please select a menu item"
echo
echo "1) Display your current directory"
echo "2) Display your home directory"
echo "3) List the contents of your current directory"
echo
read CHOICE
if [ $CHOICE = 1 ]
then
  pwd
fi
if [ $CHOICE = 2 ]
then
  echo $HOME
fi
if [ $CHOICE = 3 ]
then
  ls
fi
echo
echo "Have a great day!"




clear
echo
echo "**Script 6"
echo "Please select a menu item"
echo "1) Display your current directory"
echo "2) Display your home directory"
echo "3) List the contents of your current directory"
echo
read CHOICE
case $CHOICE in
1) pwd;;
2) echo $HOME;;
3) ls;;
*) echo "You made an invalid selection";;
esac
echo
echo "Have a great day!"



clear
echo
echo "**Script 7"
touch testfile
while cat testfile > /dev/null
do
  echo "exit status code is $1"
  sleep 1
done
echo "You deleted the file: testfile"



clear
echo
echo "**Script8"
for NUMBER in 10 9 8 7 6 5 4 3 2 1
do
  echo -n "$NUMBER "
#  sleep 1
done
echo Blast off!
