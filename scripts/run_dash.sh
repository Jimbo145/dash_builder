#!/bin/bash

XDG_RUNTIME_DIR=/run/user/1000
while true; do
    exec startx /home/pi/dash/bin/dash -- vt7
    sleep 1
done 