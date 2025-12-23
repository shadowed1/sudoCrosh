
<p align="center">
  <img src="https://i.imgur.com/kOg2ZDB.png" alt="logo" />
</p>  
<br>


<p align="center">  A ChromeOS installer for enabling sudo in crosh as fast as possible. Requires Developer Mode. </p><br> <br> <br>


Open Crosh shell (ctrl-alt-t), enter `shell`, copy paste, and run: 
<br>

<pre>bash <(curl -s "https://raw.githubusercontent.com/shadowed1/sudoCrosh/main/sudocrosh_downloader.sh?$(date +%s)")</pre>

<br>


<br>
<br>

<p align="center">
  <img src="https://i.imgur.com/mrUgSLN.png" alt="logo" />
</p> 



<br>

Each time ChromeOS is updated re-enable by running in VT-2: <br>
`bash /usr/local/sudocrosh` <br>
<br>

To disable updates see:
`https://github.com/jay0lee/cros-scripts/blob/master/disable_cros_updates.sh`

<br>

__Credits:__

Original Guide: https://gist.github.com/velzie/a5088c9ade6ec4d35435b9826b45d7a3 <br>
Created by velzie: https://github.com/velzie <br>
GUI inspired by CRAP: https://github.com/chrultrabook/crap

