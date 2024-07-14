#!/bin/bash

nmcli con add type wifi ifname wlan0 con-name SAABnet autoconnect yes ssid SAABnet
nmcli con modify SAABnet 802-11-wireless.mode ap 802-11-wireless.band a ipv4.method shared
nmcli con modify SAABnet wifi-sec.key-mgmt wpa-psk
nmcli con modify SAABnet wifi-sec.psk "1234567890"
nmcli con up SAABnet

ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf << EOCAT
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin pi --noclear %I \$TERM
EOCAT
sed /etc/lightdm/lightdm.conf -i -e "s/^\(#\|\)autologin-user=.*/autologin-user=pi/"
sed /etc/lightdm/lightdm.conf -i -e "s/^\(#\|\)xserver-command=.*/xserver-command=X -nocursor -s 0 -dpms/"