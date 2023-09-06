#!/opt/homebrew/bin/bash

# information on 'ln' can be found in /documents/coding/notes

# GENERAL TERMINAL
ln -s $HOME/.dotfiles/.profile $HOME/.profile
ln -s $HOME/.dotfiles/.hushlogin $HOME/.hushlogin

# BASH
ln -s $HOME/.dotfiles/bash/.bash_aliases $HOME/.bash_aliases
ln -s $HOME/.dotfiles/bash/.bash_profile $HOME/.bash_profile
ln -s $HOME/.dotfiles/bash/.bash_prompt $HOME/.bash_prompt
ln -s $HOME/.dotfiles/bash/.bashrc $HOME/.bashrc

# ZSH
ln -s $HOME/.dotfiles/zsh/.zprofile $HOME/.zprofile
ln -s $HOME/.dotfiles/zsh/.z_aliases $HOME/.zsh_aliases
ln -s $HOME/.dotfiles/zsh/.z_prompt $HOME/.zsh_prompt
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# GIT
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# VIM
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

# NEOFETCH
ln -s $HOME/.dotfiles/neofetch/config.conf $HOME/.config/neofetch/config.conf

# SPOTIFY CLI
ln -s $HOME/.dotfiles/spotifyd/spotifyd.conf $HOME/.config/spotifyd/spotifyd.conf
ln -s $HOME/.dotfiles/spotify-tui/config.yml $HOME/.config/spotify-tui/config.yml

