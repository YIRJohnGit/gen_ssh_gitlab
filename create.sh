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
