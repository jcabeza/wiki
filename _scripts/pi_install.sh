#!/bin/bash

# SCRIPT VARIABLES

$hostname = "PiName" # <-- A changer

# SCRIPT FUNCTION

echo -e ""
echo -e "\033[33m ------------> Installation Script for Raspberry PI (Debian Machine) <------------ \033[0m"
echo -e ""

# WARNING MESSAGE

echo -e ""
echo -e "\033[31m ------------> W A R N I N G ! \033[0m"
echo -e "\033[31m ------------> Are you sure you want to run this script ? \033[0m"
echo -e "\033[31m ------------> W A R N I N G ! \033[0m"
echo -e ""

sleep 5

# FUNCTION LIST

function osupdates { # Update packages and Upgrade system
        clear
    echo -e ""
    echo -e "\033[31m >>> Updating system... \033[0m"
        sudo apt update && apt upgrade -y
    sudo apt dist-upgrade -y
    sudo rpi-update -y
    echo -e ""
    echo -e "\033[32m >>> Done ! \033[0m"
}

function pkginstall { # Basic packages install
    clear
    echo -e ""
    echo -e "\033[31m >>> Installing Basic Packages... \033[0m"
    sudo apt install vim htop git curl unzip locate -y
    echo -e ""
    echo -e "\033[32m >>> Done ! \033[0m"
}

function hostname { # Update Hostname
    clear
    echo -e ""
    echo -e "\033[31m >>> Updating hostname... \033[0m"
    echo "$hostname" > /etc/hostname
    echo "192.168.1.170 $hostname" > /etc/hosts
    echo -e ""
    echo -e "\033[32m >>> Done ! \033[0m"
}

# MENU LIST

function menu {
        clear
        echo
        echo -e "\t\t\tAdmin Menu\n"
        echo -e "\t1. Debian OS Updates"
        echo -e "\t2. Basic packages install"
        echo -e "\t3. Update hostname"
        echo -e "\t4. nada"
        echo -e "\t0. Exit Menu\n\n"
        echo -en "\t\tEnter an Option: "
        read -n 1 option
}

while [ 1 ]
do
        menu
        case $option in

        0)
        break ;;

        1)
        osupdates ;;

        2)
        pkginstall ;;

        3)
        hostname ;;

    4)
    nada ;;

    *)
    clear
        echo "Sorry, wrong selection";;
        esac
        echo -en "\n\n\t\t\tHit any key to continue"
        read -n 1 line
done
clear
