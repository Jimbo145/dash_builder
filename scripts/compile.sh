#!/bin/bash

# https://github.com/openDsh/dash/issues/63#issuecomment-821121874
DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends wget software-properties-common dirmngr apt-transport-https lsb-release ca-certificates git sudo
DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends xserver-xorg-video-all xserver-xorg-input-all xserver-xorg-core xinit x11-xserver-utils  
DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends gstreamer1.0-plugins-good gstreamer1.0-omx xserver-xorg-video-fbturbo

# add in pi ux tweaks (icons + lxpanel plugins)
DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends pixflat-icons lxplug-bluetooth lxplug-volumepulse lxplug-network
cd /home/pi && sudo -u pi git clone https://github.com/Jimbo145/dash
#cd /home/pi/dash && sed -i 's/\(^\s*\)\(make\)\($\)/\1make -j$(nproc)/g' install.sh
#cp /home/pi/dash_pimod.patch /home/pi/dash/
#cd /home/pi/dash && git apply dash_pimod.patch

cd /home/pi/dash && sudo -u pi bash ./install.sh

mkdir -p /home/pi/.config/openDsh
apt-get clean autoclean
apt-get autoremove --yes