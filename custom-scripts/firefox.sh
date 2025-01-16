#!/bin/bash

# Add Mozilla Team's signing key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F

# Add Firefox repository
echo "deb [arch=amd64] http://ppa.launchpad.net/mozillateam/ppa/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mozilla-firefox.list

# Update package list
sudo apt update

sudo apt install -y firefox-devedition
