#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/.dotfiles/bash"
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

# Symlink .bash_profile to home directory
create_symlink "$SOURCE_DIR/.bash_profile" "$TARGET_HOME/.bash_profile"

create_symlink "$SOURCE_DIR/.bash_aliases" "$TARGET_HOME/.bash_aliases"

# Symlink .bashrc to home directory
create_symlink "$SOURCE_DIR/.bashrc" "$TARGET_HOME/.bashrc"

echo "Bash symlinking complete."
echo "====="
