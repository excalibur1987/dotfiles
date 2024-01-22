search_dir=./post-install-scripts
for entry in "$search_dir"/*
do
  eval "source $entry"
done