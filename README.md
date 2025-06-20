# sudoCrosh
An installer to make enabling sudo in crosh as fast as possible.<br>
Requires Developer Mode.

═════════════════════════════════════════════════════════════════════════


Open Crosh shell (ctrl-alt-t), copy paste, and run: 


`bash <(curl -s "https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/sudocrosh_downloader.sh?$(date +%s)")` <br>
*Downloads sudocrosh.sh and places it in /home/chronos/*

<br>

*The installer contains the same instructions for easy copy-paste:*

<br>
                                                                                                                                                    
**1.)** Install Linux development environment and start it up. <br>

**2.)** Open crosh shell (ctrl-alt-t), copy paste, and run: <br>
                                                                 
`vmc share termina Downloads` <br><br>                                                                                                                                     
                                                                                                                  
**3).** In Crostini, copy paste and run each command at a time: <br>
 
 `sudo apt-get update`<br>
 `sudo apt install gcc`<br>
 `curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/minioverride.c -o mnt/chromeos/MyFiles/Downloads/minioverride.c`<br>
 `gcc mnt/chromeos/MyFiles/Downloads/minioverride.c -o mnt/chromeos/MyFiles/Downloads/minioverride.so -shared`<br> <br>

**4).** In VT-2 (ctrl-alt-forward) login as root and run:  <br>

`sudo mv /home/chronos/sudocrosh.sh /usr/local/`
`sudo chmod +x /usr/local/sudocrosh.sh`
`sudo bash /usr/local/sudocrosh.sh`

**5).** Running sudocrosh.sh launches an installer to disable rootfs verification and enable sudo in crosh. <br>
    Reboot is required to apply disabling rootfs verification; re-run sudocrosh.sh to proceed with enabling sudo in Crosh. 

═════════════════════════════════════════════════════════════════════════

*Each time ChromeOS updates these changes are overwritten. Re-run:*
`sudo bash /usr/local/sudocrosh.sh`

Credits:

Original Guide: https://gist.github.com/velzie/a5088c9ade6ec4d35435b9826b45d7a3 <br>
Created by velzie: https://github.com/velzie <br>


