#!/usr/bin/env bash

# Define the source and target directories
SOURCE_DIR="$HOME/.dotfiles/tmux"
CONFIG_DIR="$SOURCE_DIR"
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

# Symlink .tmux.conf to home directory
create_symlink "$SOURCE_DIR/.tmux.conf" "$TARGET_HOME/.tmux.conf"
create_symlink "$SOURCE_DIR/.tmux-cht-commands" "$TARGET_HOME/.tmux-cht-commands"
create_symlink "$SOURCE_DIR/.tmux-cht-languages" "$TARGET_HOME/.tmux-cht-languages"

echo "tmux symlinking complete."
echo "====="
