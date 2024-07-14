#!/bin/bash


apt -y install --no-install-recommends raspberrypi-ui-mods lxsession
systemctl set-default graphical.target
