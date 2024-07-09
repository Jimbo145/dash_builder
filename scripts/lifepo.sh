#!/bin/bash


apt-get -y install build-essential git libsystemd-dev

cd /home/pi && sudo -u pi git clone https://github.com/xorbit/LiFePO4wered-Pi.git


cd /home/pi/LiFePO4wered-Pi 

make all

make user-install

apt-get clean autoclean
apt-get autoremove --yes
