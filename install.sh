#!/bin/bash

source ./symlinks.sh

source ./pre-install.sh

source ./apt-install.sh

chsh -s zsh
source ./install-custom-scripts.sh

sudo apt autoremove -y

source ./post-install.sh

echo "---------------Completed Successfully------------"
