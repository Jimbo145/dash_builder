#!/bin/bash

export LC_ALL=C
export LANG=en_US.UTF-8
echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale
DEBIAN_FRONTEND=noninteractive locale-gen 
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
apt-get install -y sl

useradd -m pi
echo pi:opendsh | chpasswd

sudo adduser pi sudo

# Setup ntp
apt-get install -y ntp ntpdate
service ntp stop
ntpdate 0.us.pool.ntp.org
service ntp start

# Disable boot text
sed -i 's/quiet/logo.nologo\ loglevel=3\ quiet\ plymouth.ignore-serial-consoles\ fastboot\/g'


# clear apt
apt-get clean autoclean
apt-get autoremove --yes