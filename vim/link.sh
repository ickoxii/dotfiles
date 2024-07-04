#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/dotfiles/vim"
CONFIG_DIR="$SOURCE_DIR/.vim"
TARGET_HOME="$HOME"
TARGET_CONFIG="$HOME/.vim"

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

# Symlink .vimrc to home directory
create_symlink "$SOURCE_DIR/.vimrc" "$TARGET_HOME/.vimrc"

# Symlink .vim/.colors to ~/.vim/.colors
create_symlink "$CONFIG_DIR/.colors" "$TARGET_CONFIG/.colors"

# Symlink .vim/config to ~/.vim/config
create_symlink "$CONFIG_DIR/config" "$TARGET_CONFIG/config"

echo "ViM symlinking complete."
