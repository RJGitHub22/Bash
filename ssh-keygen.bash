#!/bin/bash

clear
cd
cd .ssh
whoami
echo

echo "Enter your name as written above"
echo
read NAME
echo
echo "Enter the hostname of system you are connecting to"
echo
read HOST

ssh-keygen -t dsa
ssh-copy-id -i id_dsa.pub $NAME@$HOST 
