#!/bin/bash

nmcli con add type wifi ifname wlan0 con-name SAAB autoconnect yes ssid SAAB
nmcli con modify SAAB 802-11-wireless.mode ap 802-11-wireless.band a ipv4.method shared
nmcli con modify SAAB wifi-sec.key-mgmt wpa-psk
nmcli con modify SAAB wifi-sec.psk "1234567890"
nmcli con up SAAB

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