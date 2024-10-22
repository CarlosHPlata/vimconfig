#!/bin/bash

SOURCE_FILE="$HOME/.tmux.conf"
DESTINATION_DIR="./tmux"
DESTINATION_NAME=".tmux.conf"

rm -rf "$DESTINATION_DIR"/*

# Create the destination directory if it doesn't exist
mkdir -p "$DESTINATION_DIR"

# Copy the single file
DESTINATION_PATH="$DESTINATION_DIR/$DESTINATION_NAME"
cp "$SOURCE_FILE" "$DESTINATION_PATH"

echo "Copied $SOURCE_FILE to $DESTINATION_PATH"
