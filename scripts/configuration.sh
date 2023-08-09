
cat <<EOT >> /boot/config.txt
[pi4]
#arm_freq=1800
#core_freq=500
dtoverlay=vc4-kms-v3d
initial_turbo=30
force_turbo=1
max_framebuffers=2
arm_64bit=1
[all]
enable_uart=1
gpio=27=op,dh
boot_delay=0
dtparam=spi=on
dtoverlay=mcp2515-can0,oscillator=8000000,interrupt=12
dtoverlay=spi0-2cs
dtparam=audio=off
hdmi_group=2
hdmi_mode=87
hdmi_timings=400 0 100 10 140 1280 10 20 20 2 0 0 0 60 0 43000000 3
EOT

# CAN settings
cat <<EOT >> /etc/network/interfaces

#allow-hotplug can0
#iface can0 can static
#    bitrate 33330
EOT
#Setup network interfaces
apt-get -y install network-manager links
raspi-config nonint do_netconf 2
# setup access point
apt-get install -y vim
cat <<EOT >> /etc/dhcpcd.conf
denyinterfaces wlan0
EOT
# configure memory split and disable screensaver, set hostname
raspi-config nonint do_memory_split 128
raspi-config nonint do_hostname SAAB
sed -i 's/apt-get install realvnc-vnc-server/apt-get install -y realvnc-vnc-server/g' /usr/bin/raspi-config
raspi-config nonint do_vnc 0
raspi-config nonint do_wifi_country US
raspi-config nonint do_ssh 0
/usr/lib/raspberrypi-sys-mods/imager_custom set_keymap 'us'
/usr/lib/raspberrypi-sys-mods/imager_custom set_timezone 'America/New_York'

sudo bash -c 'cat > /usr/share/lightdm/lightdm.conf.d/99-saab.conf' << EOF
[Seat:*]
user-session=pi
EOF

sudo -u pi bash -c 'cat > ~pi/.dmrc' << EOF
[Desktop]
Session=saab
EOF

sudo bash -c 'cat > /usr/share/xsessions/saab.desktop' << EOF
[Desktop Entry]
Encoding=UTF-8
Name=Saab
Comment=Start an openDsh Kiosk
Exec=/home/pi/dash/run_dash.sh
TryExec=/home/pi/dash/run_dash.sh
Icon=google-chrome
EOF