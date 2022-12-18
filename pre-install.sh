sudo apt install curl
search_dir=./pre-install-scripts
for entry in "$search_dir"/*
do
  eval "source $entry"
done