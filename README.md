# sudoCrosh
An installer to make enabling sudo in crosh as fast as possible.<br>
Requires Developer Mode.

═════════════════════════════════════════════════════════════════════════

__How to Install:__ <br>
Open Crosh shell (ctrl-alt-t), copy paste, and run: 
<br>

`bash <(curl -s "https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/sudocrosh_downloader.sh?$(date +%s)")` <br> <br>
*Downloads sudocrosh.sh and places it in /home/chronos/*

<br>
<br>

                                                                                                                                            
__1.) Install Linux development environment and start it up.__ 

<br>

__2.) Open crosh shell (ctrl-alt-t), copy paste, and run:__ 

<br>
                                                                 
`vmc share termina Downloads` <br><br>                                                                                                                                     
                                                                                                                  
__3). In Crostini, copy paste and run each command at a time:__ 

<br>
 
 `sudo apt-get update`<br>
 `sudo apt install gcc`<br>
 `curl -L https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/minioverride.c -o mnt/chromeos/MyFiles/Downloads/minioverride.c`<br>
 `gcc mnt/chromeos/MyFiles/Downloads/minioverride.c -o mnt/chromeos/MyFiles/Downloads/minioverride.so -shared`<br> <br>

__4). In VT-2 (ctrl-alt-forward) login as root and run:__ 

<br>

`sudo mv /home/chronos/sudocrosh.sh /usr/local/` <br>
`sudo bash /usr/local/sudocrosh.sh` <br>

═════════════════════════════════════════════════════════════════════════

*Each time ChromeOS updates these changes are overwritten. Re-run:* <br>

`sudo bash /usr/local/sudocrosh.sh` <br><br>

__Credits:__

Original Guide: https://gist.github.com/velzie/a5088c9ade6ec4d35435b9826b45d7a3 <br>
Created by velzie: https://github.com/velzie <br>


