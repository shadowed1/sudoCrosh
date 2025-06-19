#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)
curl -L https://raw.githubusercontent.com/shadowed1/ChromeOS_PowerControl/main/minioverride.c -o /home/chronos/user/MyFiles/
curl -L https://raw.githubusercontent.com/shadowed1/ChromeOS_PowerControl/main/sudocrosh.sh -o /home/chronos/sudocrosh.sh
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                                                                 ║"
echo "║  Downloading to: /home/chronos/sudocrosh.sh                     ║"
echo "║  Downloading to: /home/chronos/user/MyFiles/minioverride.c      ║"
echo "║                                                                 ║"
echo "╠═════════════════════════════════════════════════════════════════╣"
echo "║                                                                 ║"
echo "║                        HOW TO INSTALL:                          ║"
echo "║                                                                 ║"
echo "╠═════════════════════════════════════════════════════════════════╣"
echo "║                                                                 ║"
echo "║              In Crostini, copy paste and run:                   ║"
echo "║                                                                 ║"
echo "║  sudo apt-get update                                            ║"
echo "║  sudo apt install gcc                                           ║"
echo "║  gcc ~/minioverride.c -o ~/minioverride.so -shared              ║"
echo "║                                                                 ║"
echo "╠═════════════════════════════════════════════════════════════════╣"
echo "║                                                                 ║"
echo "║                In the Chrome Files app, copy:                   ║"
echo "║                                                                 ║"
echo "║   minioverride.so  from My Files/Linux File's/ to My Files/     ║"
echo "║                                                                 ║"
echo "╠═════════════════════════════════════════════════════════════════╣"
echo "║                                                                 ║"
echo "║                    In VT-2 as root run:                         ║"
echo "║                                                                 ║"
echo "║  sudo mv /home/chronos/sudocrosh.sh /usr/local/                 ║"
echo "║  sudo bash /usr/local/bin/sudocrosh.sh                          ║"
echo "║                                                                 ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
