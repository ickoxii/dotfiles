#!/bin/bash

# Author: Icko Iben

# Define the source directory
DOTFILES_DIR="$HOME/.dotfiles"

# Function to create sym-links
create_symlink() {
    local src="$1"
    local dest="$2"

    # Check if anything with the same name as the destination already exists
    if [ -e "$dest" ]; then
        echo "Something already exists at $dest"

        read -p "Create back-up and symlink from $src to $dest? (y/n): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            echo "Skipping $src"
            echo "-----"
            return
        # If a file already exists at the destination, move it to a backup location
        else
            echo "Moving existing file: $dest to ${dest%/}.bak"
            mv "$dest" "${dest%/}.bak"
        fi
    fi

    create_symlink_helper "$src" "$dest"
}

# Function to safely create symbolic links
create_symlink_helper() {
    local src="$1"
    local dest="$2"

    # Create symlink
    ln -s "$src" "$dest"

    # Check if symbolic link creation was successful
    if [ $? -eq 0 ]; then
        echo "Symbolic link created successfully: $dest -> $src"
    fi

    echo "-----"
}

# >>>> Terminal >>>>
# Kitty
create_symlink "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
# <<<< Terminal <<<<


# >>>> Shell >>>>
# General
create_symlink "$DOTFILES_DIR/general-terminal/.profile" "$HOME/.profile"
create_symlink "$DOTFILES_DIR/general-terminal/.hushlogin" "$HOME/.hushlogin"

# Bash
create_symlink "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
# create_symlink "$DOTFILES_DIR/bash/.bash_profile" "$HOME/.bash_profile"
create_symlink "$DOTFILES_DIR/bash/bash" "$HOME/.config/bash"

# ZSH
create_symlink "$DOTFILES_DIR/zsh/.zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES_DIR/zsh/zsh" "$HOME/.config/zsh"

# Neofetch
create_symlink "$DOTFILES_DIR/neofetch" "$HOME/.config/neofetch"
# <<<< Shell <<<<


# >>>> Workflow >>>>
# Neovim
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Vim
create_symlink "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES_DIR/vim/config" "$HOME/.vim/config"
create_symlink "$DOTFILES_DIR/vim/.colors" "$HOME/.vim/.colors"

# TMUX
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
# <<<< Workflow <<<<
