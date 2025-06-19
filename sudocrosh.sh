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
        echo "You must reboot manually for changes to take effect."
    fi
}

clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                                                                 ║"
echo "║                     Enable sudo in crosh!                       ║"
echo "║                                                                 ║"
echo "║1) disable rootfs verification (Dev Mode required)
.3║"
echo ""
echo "2) Install minioverride.so (requires rootfs verification disabled)"
echo ""
echo "q) Quit"
echo ""

read -p "Select an option [1 / 2 / q]: " choice

case "$choice" in
    1)
        echo
        echo "This will run disable rootfs verification by running:"
        echo "/usr/libexec/debugd/helpers/dev_features_rootfs_verification"
        /usr/libexec/debugd/helpers/dev_features_rootfs_verification
        reboot_prompt
        ;;
    2)
        echo
        echo "You must disable rootfs verification to proceed."
        prompt_confirm

        if [ ! -f "/home/chronos/user/MyFiles/minioverride.so" ]; then
            echo "File not found: /home/chronos/user/MyFiles/minioverride.so"
            exit 1
        fi

        echo "Copying minioverride.so"
        mkdir -p /usr/local/bin
        cp /home/chronos/user/MyFiles/minioverride.so /usr/local/bin/
        chmod +x /usr/local/bin/minioverride.so

        echo "Patching /etc/init/ui.conf..."
        sed -i '1s/^/env LD_PRELOAD=\/usr\/local\/bin\/minioverride.so\n/' /etc/init/ui.conf 

        reboot_prompt
        ;;
    q|Q)
        echo "Exiting installer."
        exit 0
        ;;
    *)
        echo "Invalid selection. Exiting."
        exit 1
        ;;
esac
