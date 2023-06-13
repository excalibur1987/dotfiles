search_dir=./custom-scripts
for entry in "$search_dir"/*\.sh
do
  eval "source $entry"
done