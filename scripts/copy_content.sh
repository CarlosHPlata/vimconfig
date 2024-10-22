#!/bin/bash

# Function to delete and copy content
update_configs() {
  local source_path="$1"
  local destination_path="$2"

  # Delete the content in the destination path
  rm -rf "$destination_path"/*

  # Copy the content from the source path to the destination path
  rsync -av --progress "$source_path" "$destination_path"
}

