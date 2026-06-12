#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

mkdir -p /home/chronos/user/MyFiles/Downloads/sudocrosh/
curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/minioverride.c -o /home/chronos/user/MyFiles/Downloads/sudocrosh/minioverride.c
gcc /home/chronos/user/MyFiles/Downloads/sudocrosh/minioverride.c -o /home/chronos/user/MyFiles/Downloads/sudocrosh/minioverride.so -shared
