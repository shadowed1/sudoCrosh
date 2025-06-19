#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)
curl -L https://raw.githubusercontent.com/shadowed1/ChromeOS_PowerControl/main/sudocrosh.sh -o /home/chronos/sudocrosh.sh

echo "Downloading sudocrosh.sh to: /home/chronos/"   
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                                                   ║"
echo "║                                                         HOW TO INSTALL:                                           ║"
echo "║                                                                                                                   ║"
echo "║  1.) Install Linux development environment and start it up.                                                       ║"
echo "║  2.) Open crosh shell (ctrl-alt-t), copy paste, and run:                                                          ║"
echo "║                                                                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
echo "${GREEN}vmc share termina Downloads${RESET}"
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                                                   ║"
echo "║  3). In Crostini, copy paste and run:                                                                             ║"
echo "║                                                                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
echo "${CYAN}sudo apt-get update"
echo "sudo apt install gcc"
echo "curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/minioverride.c -o mnt/shared/MyFiles/Downloads/"
echo "gcc ~/minioverride.c -o ~/minioverride.so -shared${RESET}"
echo ""
echo "╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                                                   ║"
echo "║  4). In VT-2 (ctrl-alt-forward) login as root and run:                                                            ║"
echo "║                                                                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
echo "${BLUE}sudo mv /home/chronos/sudocrosh.sh /usr/local/"
echo "sudo bash /usr/local/sudocrosh.sh${RESET}"
echo ""
