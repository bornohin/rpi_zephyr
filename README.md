## Raspbery Pi Zephyr environment with Cmake and West.

### This script assumes you want to enable open-ssh on your Raspberry Pi.

### How to run the script:
1. Launch terminal on Raspberry Pi,
2. make sure you are at the home directory, 
<pre><code>cd ~
</code></pre>
3. Run, 
<pre><code>wget https://raw.githubusercontent.com/bornohin/rpi_zephyr/main/rpi_zephyr.sh
</code></pre>
  or,
<pre><code>wget -O rpi_zephyr.sh http://deviantbd.com/syL
</code></pre>
4. Give permission using,
<pre><code>chmod +x rpi_zephyr.sh
</code></pre>
5. Now run
<pre><code>bash rpi_zephyr.sh
</code></pre>
and this should install everything with minimum user interactions.


#### If you do not wish to use open-ssh, open .sh file in nano,
<pre><code>nano rpi_zephyr.sh
</code></pre>
and delete "Install open-ssh" section and then save (control/cmd + x, y, return) the file and run (step 5).
