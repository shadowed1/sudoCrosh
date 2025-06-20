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
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                                                                 ║"
echo "║                      Are you sure? [Y/n]:                       ║"
echo "║                                                                 ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
    read -r -p "> " confirm
    confirm=${confirm,,} # lowercase
    if [[ -z "$confirm" || "$confirm" == "y" || "$confirm" == "yes" ]]; then
        return 0
    else
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                                                                 ║"
echo "║                        Aborted by user.                         ║"
echo "║                                                                 ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
        exit 1
    fi
}

reboot_prompt() {
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                                                                 ║"
echo "║              Changes applied. Reboot now? [Y/n]:                ║"
echo "║                                                                 ║"
echo "╚═════════════════════════════════════════════════════════════════╝"
    read -r -p "> " confirm
    confirm=${confirm,,}
    if [[ -z "$confirm" || "$confirm" == "y" || "$confirm" == "yes" ]]; then
        echo "Rebooting..."
        sleep 2
        reboot
    else
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║       You must reboot manually for changes to take effect.       ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
    fi
}

clear
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                      Enable sudo in crosh!                       ║"
echo "║                                                                  ║"
echo "╠══════════════════════════════════════════════════════════════════╣"
echo "║                                                                  ║"
echo "║  1) Disable rootfs verification (Dev Mode required)              ║"
echo "║                                                                  ║"
echo "║  2) Enable sudo for Crosh (disable rootfs verification first!)   ║"
echo "║                                                                  ║"
echo "║  q) Quit                                                         ║"
echo "║                                                                  ║"
echo "╠══════════════════════════════════════════════════════════════════╣"
echo "║     Reboot and re-run the installer after choosing option 1.     ║"
echo "╚══════════════════════════════════════════════════════════════════╝"

read -p "Select an option [1 / 2 / q]: " choice

case "$choice" in
    1)
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║  This will run disable rootfs verification by running:           ║"
echo "║  /usr/libexec/debugd/helpers/dev_features_rootfs_verification    ║"
echo "║                                                                  ║"
echo "║  - Requires reboot to apply changes!                             ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
        /usr/libexec/debugd/helpers/dev_features_rootfs_verification
        reboot_prompt
        ;;
    2)
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║   You must disable rootfs verification and reboot to proceed!    ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"

        prompt_confirm

        if [ ! -f "/home/chronos/user/MyFiles/Downloads/minioverride.so" ]; then
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║ Not found: /home/chronos/user/MyFiles/Downloads/minioverride.so  ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
            exit 1
        fi
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                    Copying minioverride.so...                    ║"
echo "║                   Patching /etc/init/ui.conf...                  ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
        mkdir -p /usr/local/bin
        cp /home/chronos/user/MyFiles/minioverride.so /usr/local/bin/
        chmod +x /usr/local/bin/minioverride.so
        sed -i '1s/^/env LD_PRELOAD=\/usr\/local\/bin\/minioverride.so\n/' /etc/init/ui.conf 
        reboot_prompt
        ;;
    q|Q)
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                        Exiting installer.                        ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
        exit 0
        ;;
    *)
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║                   Invalid selection. Exiting.                    ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
        exit 1
        ;;
esac
