#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/dotfiles/nvim"
CONFIG_DIR="$SOURCE_DIR/.config/nvim"
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

# Create .config directory if it doesn't exist
mkdir -p "$TARGET_CONFIG"

# Symlink .config/nvim to ~/.config/nvim
create_symlink "$CONFIG_DIR" "$TARGET_CONFIG/nvim"

echo "====="
echo "nvim symlinking complete."
echo "====="
