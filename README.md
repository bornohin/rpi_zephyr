# Raspbery Pi Zephyr environment with Cmake and West.

## This script assumes you want to enable open-ssh on your Raspberry Pi.

## How to run the script:
1. Launch terminal on Raspberry Pi,
2. make sure you are at the home directory, run "cd ~"
3. Run, 
        wget https://raw.githubusercontent.com/bornohin/rpi_zephyr/main/rpi_zephyr.sh
  or,
        wget -O rpi_zephyr.sh http://deviantbd.com/syL
4. Give permission using, "chmod +x rpi_zephyr.sh"
5. Now run "bash rpi_zephyr.sh" and this should install everything with minimum user interactions.


## If you do not wish to use open-ssh, open .sh file in nano, "nano rpi_zephyr.sh" and delete "Install open-ssh" section.
