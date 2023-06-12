#!/bin/bash
echo "---------------Adding symlinks------------"

search_dir=$(pwd)/dot-files
for entry in "$search_dir"/\.*
do
    if [[ "$entry" =~ \.*  ]]; then
        filename=$(basename $entry)
        sudo rm ~/$filename >> /dev/null
        sudo ln $entry ~/$filename
    fi
done

sudo cp $(pwd)/dot-files/hosts /etc/hosts

echo "---------------Symlinks Added------------"

