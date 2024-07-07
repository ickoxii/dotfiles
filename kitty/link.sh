#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/dotfiles/kitty"
CONFIG_DIR="$SOURCE_DIR/.config/kitty"
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

# Create .config directory if it doesn't exist
mkdir -p "$TARGET_CONFIG"

# Symlink .config/zsh to ~/.config/zsh
create_symlink "$CONFIG_DIR" "$TARGET_CONFIG/kitty"

echo "====="
echo "Kitty symlinking complete."
echo "====="
