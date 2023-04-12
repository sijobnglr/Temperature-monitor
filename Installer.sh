#!/bin/bash

sudo apt update && sudo apt upgrade && bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) && sudo systemctl enable nodered.service && cd ~/.node-red && npm install @node-red-contrib-themes/theme-collection && npm install node-red-dashboard && npm install node-red-contrib-oled && npm install node-red-contrib-dht-sensor && npm install node-red-node-email && node-red restart

