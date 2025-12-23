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
curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/sudocrosh.sh -o /home/chronos/sudocrosh
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
  curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/x86_64_minioverride.so -o /home/chronos/minioverride.so
elif [[ "$ARCH" == "aarch64" ]]; then
  curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/aarch_minioverride.so -o /home/chronos/minioverride.so
else
  echo "${RED}Unsupported architecture: $ARCH ${RESET}"
fi
echo "${BOLD}Downloading sudocrosh.sh to: /home/chronos/${RESET}"
echo "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║      In VT-2 (ctrl-alt-F2) login as root and run:            ║"
echo "║      Use Tab key to auto-complete the paths.                 ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo "${RESET}${MAGENTA}${BOLD}"
echo "mv /home/chronos/sudocrosh /usr/local/"
echo "bash /usr/local/sudocrosh"
echo "${RESET}"
echo "${RESET}${YELLOW}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║ Each time ChromeOS gets an update, sudo will be disabled.    ║"
echo "║ In VT-2 (ctrl-alt-F2) login as root and run:                 ║"
echo "║ ${RESET}${BLUE}bash /usr/local/sudocrosh${RESET}${YELLOW}                                 ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo "${RESET}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              Original guide created by Velzie:               ║"
echo "║                  https://github.com/velzie                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
