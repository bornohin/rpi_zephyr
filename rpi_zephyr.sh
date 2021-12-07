#!/bin/bash
echo "** Script developed by Tom Islam. tom@tomislam.com **"
# echo "This script should allow automatic zephyr installation on Raspberry Pi 4. Some user control is required"
echo "This script will ocassionally need user to allow some installation"
read -t 5 -p "Make suse ssh is active and enabled. \nThe installation process will start in 5 seconds."
# Bash Script to install Zephyr
cd ~
sudo apt-get update -q
sudo apt-get upgrade -y

Install open-ssh
sudo apt-get install -y openssh-server openssh-client
sudo ufw allow ssh
sudo ufw enable

# Install other packages
sudo apt-get install -yy git ninja-build gperf ccache \
dfu-util device-tree-compiler wget build-essential gdb \
libssl-dev make gcc gcc-multilib-arm-linux-gnueabihf \
g++-multilib-arm-linux-gnueabihf libsdl2-dev python3-dev \
python3-pip python3-setuptools python3-tk python3-wheel \
xz-utils file cargo openocd libusb-dev python3

# Install the toolchain/SDK
cd ~
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.13.1/zephyr-sdk-0.13.1-linux-aarch64-setup.run
sudo chmod +x zephyr-sdk-0.13.1-linux-aarch64-setup.run
./zephyr-sdk-0.13.1-linux-aarch64-setup.run -- -d ~/zephyr-sdk-0.13.1

cd ~
# Remove Tool-Chain packages
cd ~
rm -f zephyr-sdk-0.13.1-linux-aarch64-setup.run

# Install udev rules to allow board flashing 
sudo cp ~/zephyr-sdk-0.13.1/sysroots/aarch64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d

# For WSL
# sudo cp ~/zephyr-sdk-0.13.1/sysroots/x86_64-pokysdk-linux/usr/share/openocd/contrib/60-openocd.rules /etc/udev/rules.d
sudo udevadm control –reload

# Install west and initialize a new Zephyr project
pip3 install --user -U west
echo 'export PATH=~/.local/bin:"$PATH"' >> ~/.bashrc
source ~/.bashrc

cd ~
mkdir zephyrproject && cd zephyrproject
west init 
west update
west zephyr-export
pip3 install --user -r zephyr/scripts/requirements.txt

# echo "All process finished"
# West Version
# echo $(west --version)

# Bash Script to install Zephyr part 3.

cd ~
sudo apt remove --purge --auto-remove cmake -y

cd /opt/

# go to /opt/ root folder and type the following to install the bash file
sudo wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-linux-aarch64.sh

# while in /opt/ update permissions to bash script
sudo chmod +x cmake-3.22.1-linux-aarch64.sh

# run bash script in /opt/ to install the binary to the cmake version
sudo bash /opt/cmake-3.22.1-linux-aarch64.sh

# make a symbolic link to get the cmake command
sudo ln -s /opt/cmake-3.22.1-linux-aarch64/bin/* /usr/local/bin

# Test your version
echo "**** Cmake installed. ****"
echo $(cmake --version)


