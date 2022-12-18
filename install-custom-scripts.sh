search_dir=./custom-scripts
for entry in "$search_dir"/*
do
  eval "source $entry"
done