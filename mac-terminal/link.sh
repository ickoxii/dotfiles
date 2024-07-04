#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/dotfiles/mac-terminal"
TARGET_HOME="$HOME"

# Function to create a symlink if it doesn't exist
create_symlink() {
    local source="$1"
    local target="$2"
    if [ ! -e "$target" ] && [ ! -L "$target" ]; then
        ln -s "$source" "$target"
        echo "Created symlink: $target -> $source"
    else
        echo "Skipped: $target (already exists or is a symlink)"
    fi
}

# Symlink .hushlogin to home directory
create_symlink "$SOURCE_DIR/.hushlogin" "$TARGET_HOME/.hushlogin"

# Symlink .profile to home directory
create_symlink "$SOURCE_DIR/.profile" "$TARGET_HOME/.profile"

echo "General mac terminal symlinking complete."
