#! /bin/bash

echo "installing node red and required nodes for stpl temperature controller.. please wait"
&& sudo apt update 
&& sudo apt upgrade 
&& bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) 
&& sudo systemctl enable nodered.service
&& sudo apt install i2c-tools
&& cd ~/.node-red
&& sudo npm install --unsafe-perm -g node-red-contrib-dht-sensor
&& npm install node-red-contrib-oled
&& npm i node-red-dashboard
&& npm i node-red-node-email
&& node-red-restart
&& sudo reboot
