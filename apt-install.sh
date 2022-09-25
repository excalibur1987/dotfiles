#!/bin/bash

echo "---------------installing packages-----------"
iter=0
cmd="sudo apt update || true && sudo apt upgrade -y || true && sudo apt install "
packages=0
while IFS= read -r line; do
    if [[ "$iter" -eq 5 ]]; then
        cmd="$cmd -y|| true &&sudo apt update || true && sudo apt upgrade -y || true && sudo apt install"
        iter=$((iter*0))
    fi
    cmd=$cmd" "$line" -y"
    iter=$((iter+1))
    packages=$((packages+1))
done < apt-packages.txt

eval $cmd

echo "-------------------------------------------------------"
echo "---------------$packages packages installed------------"
