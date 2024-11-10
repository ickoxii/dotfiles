#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/dotfiles/.local/bin"
TARGET_DIR="$HOME/.local"

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

# Create .local directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Symlink .local/bin to ~/.local/bin
create_symlink "$SOURCE_DIR" "$TARGET_DIR/bin"

echo "====="
echo ".local/bin symlinking complete."
echo "====="
