#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/dotfiles/bash"
CONFIG_DIR="$SOURCE_DIR/.config/bash"
TARGET_HOME="$HOME"
TARGET_CONFIG="$HOME/.config"

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

# Symlink .bashrc to home directory
create_symlink "$SOURCE_DIR/.bashrc" "$TARGET_HOME/.bashrc"

# Create .config directory if it doesn't exist
mkdir -p "$TARGET_CONFIG"

# Symlink .config/bash to ~/.config/bash
create_symlink "$CONFIG_DIR" "$TARGET_CONFIG/bash"

echo "====="
echo "Bash symlinking complete."
echo "====="
