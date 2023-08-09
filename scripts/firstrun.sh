#!/bin/bash

nmcli con add type wifi ifname wlan0 con-name SAABnet autoconnect yes ssid SAABnet
nmcli con modify SAABnet 802-11-wireless.mode ap 802-11-wireless.band a ipv4.method shared
nmcli con modify SAABnet wifi-sec.key-mgmt wpa-psk
nmcli con modify SAABnet wifi-sec.psk "1234567890"
nmcli con up SAABnet

# Disable boot text
sed -i 's/quiet/logo.nologo\ loglevel=3\ quiet\ plymouth.ignore-serial-consoles\ fastboot\/g'

systemctl disable systemd-timesyncd
systemctl disable cups.service
systemctl disable avahi-daemon.service
systemctl disable dphys-swapfile.service
systemctl disable apt-daily.service
systemctl disable keyboard-setup.service
#systemctl disable raspi-config.service
systemctl disable triggerhappy.service
systemctl disable apt-daily-upgrade.service
systemctl disable man-db.service
systemctl disable ntp.service
systemctl disable rpi-eeprom-update