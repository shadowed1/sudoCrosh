# sudoCrosh
An installer to make enabling sudo in crosh as fast as possible. 

## Open Crosh shell (ctrl-alt-t), copy paste, and run:

`bash <(curl -s "https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/sudocrosh_downloader.sh?$(date +%s)")`


The installer contains the instructions for easy copy-paste. 

<br>
<br>
                                                                 
HOW TO INSTALL:                          
                                                                 
1): In Crostini, copy paste and run: <br>
                                                                                                                                            
  `sudo apt-get update`                                            
  `sudo apt install gcc`                                           
  `gcc ~/minioverride.c -o ~/minioverride.so -shared`              

<br>


2):
                                                                 
In the Chrome Files app, copy:                   
                                                                 
`minioverride.so` from My Files/Linux File's/ to My Files/     
                                                                                                                  
3):

In VT-2 as root run:                         
                                                                 
                                                                 
  `sudo mkdir -p /usr/local/bin`                                   
  `mv /home/chronos/user/MyFiles/minioverride.so /usr/local/bin/`  
  `mv /home/chronos/sudocrosh.sh /usr/local/bin`                   
  `chmod +x /usr/local/bin/minioverride.so`                        
  `bash /usr/local/bin/sudocros.sh`                                     
                                                                 


After rebooting you should be able to use sudo inside crosh as you would normally before updating to 117. It will display the warning, but sudo should work regardless.

*Each time ChromeOS updates these changes are overwritten. Do step 1 and step 6 again. Keep a copy of your minioverride.c and .so handy.* 

Original Guide: https://gist.github.com/velzie/a5088c9ade6ec4d35435b9826b45d7a3 
Created by velzie: https://gist.github.com/velzie 

This is rewritten by shadowed1 to be a faster setup. Enabling sudo in crosh shell: 
