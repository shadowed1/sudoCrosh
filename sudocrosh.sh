#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

prompt_confirm() {
echo "${YELLOW}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                      Are you sure? [Y/n]:                        ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
    read -r -p "> " confirm
    confirm=${confirm,,} # lowercase
    if [[ -z "$confirm" || "$confirm" == "y" || "$confirm" == "yes" ]]; then
        return 0
    else
echo "${RED}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                        Exited by user.                           ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        exit 1
    fi
}

reboot_prompt() {
echo "${GREEN}"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                                                                 ║"
echo "║              Changes applied. Reboot now? [Y/n]:                ║"
echo "║                                                                 ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
    read -r -p "> " confirm
    confirm=${confirm,,}
    if [[ -z "$confirm" || "$confirm" == "y" || "$confirm" == "yes" ]]; then
        echo "Rebooting..."
        sleep 2
        reboot
    else
echo "${MAGENTA}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║       You must reboot manually for changes to take effect.       ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${MAGENTA}"
    fi
}

clear
echo "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                   ${BOLD}Enable sudo for Crosh shell:${RESET}${CYAN}                   ║"
echo "║                                                                  ║"
echo "╠══════════════════════════════════════════════════════════════════╣"
echo "║                                                                  ║"
echo "║  1) Disable rootfs verification (Dev Mode required)              ║"
echo "║                                                                  ║"
echo "║  2) Enable sudo for Crosh (disable rootfs verification first)    ║"
echo "║                                                                  ║"
echo "╠══════════════════════════════════════════════════════════════════╣"
echo "║                                                                  ║"
echo "║                             ${BOLD}Extras:${RESET}${CYAN}                              ║"
echo "║                                                                  ║"
echo "╠══════════════════════════════════════════════════════════════════╣"
echo "║                                                                  ║"
echo "║  3) Remove sudoCrosh                                             ║"
echo "║                                                                  ║"
echo "║  4) Disable ChromeOS Auto Updating - Remember if choosing!       ║"
echo "║                                                                  ║"
echo "║  5) Enable ChromeOS Auto Updating                                ║"
echo "║                                                                  ║"
echo "║  q) Quit                                                         ║"
echo "║                                                                  ║"
echo "╠══════════════════════════════════════════════════════════════════╣"
echo "║     ${BOLD}Reboot and re-run the installer after choosing option 1.${RESET}${CYAN}     ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"

read -p "Select an option: [1 / 2 / 3 / 4 / 5 / q] " choice

case "$choice" in
    1)
echo "${BLUE}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║  This will run disable rootfs verification by running:           ║"
echo "║  /usr/libexec/debugd/helpers/dev_features_rootfs_verification    ║"
echo "║                                                                  ║"
echo "║  - Requires reboot to apply changes!                             ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        /usr/libexec/debugd/helpers/dev_features_rootfs_verification
        reboot_prompt
        ;;
    2)
echo "${YELLOW}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║   You must disable rootfs verification and reboot to proceed!    ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"

        prompt_confirm

        if [ ! -f "/home/chronos/user/MyFiles/Downloads/sudocrosh/minioverride.so" ]; then
echo "${RED}"
echo "╔════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                            ║"
echo "║ Not found: /home/chronos/user/MyFiles/Downloads/sudocrosh/minioverride.so  ║"
echo "║                                                                            ║"
echo "╚════════════════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
            exit 1
        fi
echo "${GREEN}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                    Copying minioverride.so...                    ║"
echo "║                   Patching /etc/init/ui.conf...                  ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        mkdir -p /usr/local/bin
        cp /home/chronos/user/MyFiles/Downloads/sudocrosh/minioverride.so /usr/local/bin/
        chmod +x /usr/local/bin/minioverride.so
        UI_CONF="/etc/init/ui.conf"
        sed -i '/^env LD_PRELOAD=\/usr\/local\/bin\/minioverride\.so$/d' "$UI_CONF"
sed -i '/^# <<< SUDOCROSH MARKER <<</,/^# <<< END SUDOCROSH MARKER <<</d' "$UI_CONF"
{
    echo
    echo "# <<< SUDOCROSH MARKER <<<"
    echo "env LD_PRELOAD=/usr/local/bin/minioverride.so"
    echo "# <<< END SUDOCROSH MARKER <<<"
} >> "$UI_CONF"
        reboot_prompt
        ;;
    3)
echo "${RED}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║  This will remove sudoCrosh and re-disable sudo in shell.        ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        prompt_confirm
        CHROMEOS_UICONF="/etc/init/ui.conf"
        TARGET_FILE=""
        
        if [ -f "$CHROMEOS_UICONF" ]; then
            TARGET_FILE="$CHROMEOS_UICONF"
        fi
        
        if [ -n "$TARGET_FILE" ]; then
            sed -i '/^# <<< SUDOCROSH MARKER <<</,/^# <<< END SUDOCROSH MARKER <<</d' "$TARGET_FILE"
        else
            echo "${RED}No ui.conf found! ${RESET}"
        fi
        
        rm /usr/local/bin/minioverride.so 2>/dev/null
        rm /usr/local/sudocrosh 2>/dev/null
        rm -rf /home/chronos/user/MyFiles/Downloads/sudocrosh 2>/dev/null
        echo "${GREEN}sudoCrosh successfully removed. ${RESET}"
        echo "${YELLOW}Rootfs verification will remain disabled until ChromeOS updates or PowerWash. ${RESET}"
        echo
        reboot_prompt
        exit 0
        ;;
    4)
echo "${RED}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║  This will disable ChromeOS auto updates by creating a file      ║"
echo "║  that tells ChromeOS it is up to date. Can be removed anytime.   ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        prompt_confirm
        mkdir -p /mnt/stateful_partition/etc
        bash -c 'echo "CHROMEOS_RELEASE_VERSION=99999.9.9" > /mnt/stateful_partition/etc/lsb-release'
        reboot_prompt
        ;;
    5)
echo "${GREEN}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║  This will re-enable ChromeOS auto updates by removing a file    ║"
echo "║  that tells ChromeOS it is up to date. Reboot to allow update.   ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        prompt_confirm
        rm /mnt/stateful_partition/etc/lsb-release 2>/dev/null
        reboot_prompt
        ;;
    q|Q)
echo "${MAGENTA}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                        Exiting installer.                        ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        exit 0
        ;;
    *)
echo "${RED}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                   Invalid selection. Exiting.                    ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo "${RESET}"
        exit 1
        ;;
esac
