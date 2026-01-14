#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)
echo ""
echo ""
echo ""
echo "${YELLOW}"
echo "        ::::::::  :::    ::: :::::::::   ::::::::          ::::::::  :::::::::   ::::::::   ::::::::  :::    :::"
echo "      :+:    :+: :+:    :+: :+:    :+: :+:    :+:        :+:    :+: :+:    :+: :+:    :+: :+:    :+: :+:    :+:"
echo "     +:+        +:+    +:+ +:+    +:+ +:+    +:+        +:+        +:+    +:+ +:+    +:+ +:+        +:+    +:+"   
echo "    +#++:++#++ +#+    +:+ +#+    +:+ +#+    +:+        +#+        +#++:++#:  +#+    +:+ +#++:++#++ +#++:++#++"    
echo "          +#+ +#+    +#+ +#+    +#+ +#+    +#+        +#+        +#+    +#+ +#+    +#+        +#+ +#+    +#+"     
echo "  #+#    #+# #+#    #+# #+#    #+# #+#    #+#        #+#    #+# #+#    #+# #+#    #+# #+#    #+# #+#    #+#"      
echo "  ########   ########  #########   ########          ########  ###    ###  ########   ########  ###    ###${RESET}"       
echo ""                                                  
echo ""
echo ""
if [[ -d /home/chronos/user/MyFiles/Downloads ]]; then
    mkdir -p /home/chronos/user/MyFiles/Downloads/sudocrosh
    curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/sudocrosh.sh -o /home/chronos/sudocrosh
fi
echo "${BOLD}${BLUE}Downloading sudocrosh to: /home/chronos/${RESET}"   
echo "${BLUE}" 
echo "╔═══════════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                           ║"
echo "║  ${RESET}${YELLOW}${BOLD}HOW TO INSTALL: ${RESET}${BLUE}                                                                         ║"
echo "║                                                                                           ║"
echo "║  1.) Install Linux development environment and start it up.                               ║"
echo "║  2.) Open files app in ChromeOS and right click Downloads folder and share it with Linux. ║"
echo "║                                                                                           ║"
echo "╚═══════════════════════════════════════════════════════════════════════════════════════════╝"
echo "${RESET}${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║  3). In Crostini, copy paste and run:                        ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo "${RESET}${CYAN}${BOLD}"
echo "sudo apt-get update"
echo "sudo apt install -y gcc"
echo "mkdir -p /mnt/chromeos/MyFiles/Downloads/sudocrosh/"
echo "curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/minioverride.c -o /mnt/chromeos/MyFiles/Downloads/sudocrosh/minioverride.c"
echo "gcc /mnt/chromeos/MyFiles/Downloads/sudocrosh/minioverride.c -o /mnt/chromeos/MyFiles/Downloads/sudocrosh/minioverride.so -shared"
echo "${RESET}${MAGENTA}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║  4). In VT-2 (ctrl-alt-refresh) login as root and run:       ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo "${RESET}${MAGENTA}${BOLD}"
echo "mv /home/chronos/sudocrosh /usr/local/"
echo
echo "bash /usr/local/sudocrosh"
echo "${RESET}${YELLOW}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║ Each time ChromeOS gets an update, sudo will be disabled.    ║"
echo "║ In VT-2 (ctrl-alt-F2) login as root and run:                 ║"
echo "║ ${RESET}${BLUE}bash /usr/local/sudocrosh${RESET}${YELLOW}                                    ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo "${RESET}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              Original guide created by Velzie:               ║"
echo "║                  https://github.com/velzie                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
