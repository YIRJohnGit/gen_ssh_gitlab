#!/bin/bash

# Function to display colored messages
color_echo() 
{
    case "$1" in
        red)    echo -e "\e[91m$2\e[0m";;
        green)  echo -e "\e[92m$2\e[0m";;
        yellow) echo -e "\e[93m$2\e[0m";;
        *)      echo "$2";;
    esac
}

color_echo "green" "Objective: SSH configuration for setting up for CICD"

color_echo "yellow" "Enter an email OR your name OR ID [yi***@gmail.com]: "
read user_ssh_input

ssh-keygen -t rsa -b 2048 -C "${user_ssh_input}"
cat ~/.ssh/id_rsa.pub | cat >> ~/.ssh/authorized_keys
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys

echo "{
Need to add he below be if not added earlier
sudo vim /etc/ssh/sshd_config
PubkeyAuthentication yes
PasswordAuthentication no
}"
sudo systemctl restart sshd

