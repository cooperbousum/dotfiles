#!/bin/bash

# Define the target directory
TARGET_DIR="/home/cooperbousum/Downloads/randomwall"

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' not found."
  exit 1
fi

# Find all files in the directory (excluding subdirectories) and pipe to shuf
# -type f: Only consider files
# -maxdepth 1: Limit search to the current directory (no subdirectories)
# -print0: Use null character as a separator for filenames (handles spaces/special characters)
# shuf -zn1: Shuffle the input and pick only one random line, using null as separator
# xargs -0: Read null-separated items from standard input and execute command
# basename: Extract the filename from the full path
RANDOM_FILE=$(find "$TARGET_DIR" -maxdepth 1 -type f -print0 | shuf -zn1 | xargs -0 basename)

# Print the name of the random file
echo "$TARGET_DIR/$RANDOM_FILE"
