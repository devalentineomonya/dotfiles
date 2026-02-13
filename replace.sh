#!/bin/bash

CONFIG_DIR="$HOME/Desktop/learningCoding/configurations" 

CAELESTIA_DIR="$HOME/.local/share/caelestia"

# Use find to get all first-level directories
find "$CONFIG_DIR" -mindepth 1 -maxdepth 1 -type d | while read folder; do
    folder_name=$(basename "$folder")
    dest="$CAELESTIA_DIR/$folder_name"

    if [ -d "$dest" ]; then
        echo "Syncing $folder_name..."
        rsync -a --delete "$folder/" "$dest/"
    else
        echo "Skipping $folder_name; does not exist in Caelestia."
    fi
done

echo "All done!"

