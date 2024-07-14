chown pi:pi /home/pi/.config/openDsh/dash.conf
chown pi:pi /home/pi/dash/openauto.ini

systemctl daemon-reload
systemctl enable dash.service
systemctl start dash.service

apt install -y xserver-xorg xinit x11-xserver-utils

  # Create .xinitrc
echo "Creating ~/.xinitrc"
cat <<EOT > $HOME/.xinitrc
#!/usr/bin/env sh
xset -dpms
xset s off
xset s noblank

while [ true ]; do
  sh $HOME/run_dash.sh
done
EOT

 apt-get clean autoclean
 apt-get autoremove --yes