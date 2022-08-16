#!/usr/bin/env bash

### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }
fn_goodafternoon() { echo; echo "Good afternoon."; }
fn_goodmorning() { echo; echo "Good morning."; }
fn_bye() { echo "Goodbye."; exit 0; }
fn_fail() { echo "Wrong option." exit 1; }

mainmenu() {
    echo -ne "
$(yellowprint 'MEGA-MENU')
$(greenprint '1)') Create a Folder
$(greenprint '2)') Download a File
$(blueprint '3)') Set a password
$(magentaprint '4)') Check filenames
$(redprint '0)') Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        fn_goodmorning
        sub-submenu
        ;;
    2)
        fn_goodafternoon
        sub-submenu
        ;;
    3)
        submenu
        ;;
    4)
        echo "Check filenames"
        ;;
    5)
        echo "5"
        ;;
    6)
        echo "6"
        ;;
    7)
        echo "7"
        ;;
    8)
        fn_bye
        ;;
    *)
        fn_fail
        ;;
    esac
}

mainmenu