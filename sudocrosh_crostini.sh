#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

sudo apt update
sudo apt install -y gcc

if [ -d /mnt/shared/MyFiles/Downloads ]; then
    SUDOCROSH="/mnt/shared/MyFiles/Downloads/sudocrosh"
elif [ -d /mnt/chromeos/MyFiles/Downloads ]; then
    SUDOCROSH="/mnt/chromeos/MyFiles/Downloads/sudocrosh"
else
    echo "${RED}Downloads directory not found${RESET}"
    sleep 5
    exit 1
fi

mkdir -p "$SUDOCROSH"
curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/minioverride.c -o "$SUDOCROSH/minioverride.c"
gcc "$SUDOCROSH/minioverride.c" -o "$SUDOCROSH/minioverride.so" -shared
