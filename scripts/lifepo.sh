#!/bin/bash


sudo apt-get -y install build-essential git libsystemd-dev

cd /home/pi && sudo -u pi git clone https://github.com/xorbit/LiFePO4wered-Pi.git


cd /home/pi/LiFePO4wered-Pi 

make all

sudo make user-install

sudo apt-get clean autoclean
sudo apt-get autoremove --yes
