#!/bin/bash

source ./symlinks.sh

source ./pre-install.sh

iter=0
cmd="sudo apt update && sudo apt upgrade -y && sudo apt install "
packages=0
while IFS= read -r line; do
    if [[ "$iter" -eq 5 ]]; then
        cmd="$cmd -y&&sudo apt update && sudo apt upgrade -y && sudo apt install"
        iter=$((iter*0))
    fi
    cmd=$cmd" "$line" -y"
    iter=$((iter+1))
    packages=$((packages+1))
done < apt-packages.txt

eval $cmd

sudo apt autoremove

echo "---------------$packages packages installed------------"
