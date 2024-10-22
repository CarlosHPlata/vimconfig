#!/bin/bash

SOURCE_PATH="$HOME/.config/nvim/"
DESTINATION_PATH="./luavim"

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/copy_content.sh"


update_configs "$SOURCE_PATH" "$DESTINATION_PATH"
