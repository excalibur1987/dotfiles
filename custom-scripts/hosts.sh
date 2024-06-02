#!/bin/bash

# Source file containing the lines to process
SOURCE_FILE=$(pwd)"/dot-files/hosts"

# Hosts file to be updated
HOSTS_FILE="/etc/hosts"

# Read each line from the source file
while IFS="" read -r line || [ -n "$line" ]
do
  # Split the line by spaces and get the first word
  first_word=$(echo $line | awk '{print $1}')

  # Check if the first word is already present in the hosts file
  if sudo grep -q "^$first_word" "$HOSTS_FILE"; then
    # If present, replace the existing line with the new line
    sudo sed -i "/^$first_word/c\\$line" "$HOSTS_FILE"
  else
    # If not present, append the new line to the end of the hosts file
    sudo echo "$line" >> "$HOSTS_FILE"
  fi
done < "$SOURCE_FILE"
