#!/bin/bash

# Check if docker group exists
if ! getent group docker > /dev/null; then
    echo "Creating docker group..."
    sudo groupadd docker
fi

# Add current user to docker group
echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

# Activate changes to docker group
echo "Activating changes..."
newgrp docker

echo "Docker permissions configured successfully!"
echo "Please log out and log back in for changes to take effect completely."