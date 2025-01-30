#!/bin/bash

# Install pulseaudio-module-xrdp for remote audio
# solution as found in https://askubuntu.com/questions/1444871/hyper-v-ubuntu-guest-vm-has-no-audio-output-despite-claims-to-the-opposite-in-of

sudo apt install build-essential dpkg-dev libpulse-dev git autoconf libtool -y
cd ~
git clone https://github.com/neutrinolabs/pulseaudio-module-xrdp.git
cd ~/pulseaudio-module-xrdp
scripts/install_pulseaudio_sources_apt_wrapper.sh
./bootstrap && ./configure PULSE_DIR=~/pulseaudio.src
make
sudo make install
ls $(pkg-config --variable=modlibexecdir libpulse) | grep xrdp