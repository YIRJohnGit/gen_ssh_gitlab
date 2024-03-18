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

ssh-keygen -t rsa -b 2048 -C "${user_ssh_input}" -f ~/.ssh/id_rsa_auto_gen -N ""

cat ~/.ssh/id_rsa_auto_gen.pub | cat >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

cat <<EOF
{
Need to add the below if not added earlier
sudo vim /etc/ssh/sshd_config
PubkeyAuthentication yes
PasswordAuthentication no

#Below is an example for ACCESSING THE REMOTE MACHINE
ssh -o StrictHostKeyChecking=no -i ~/ssh_keys/devdevopspuratinet_key.pvt devdevopspurtainetcom@dev.devops.purtainet.com

}
EOF



