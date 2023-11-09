# .bash_profile
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 03:03 CDT
# Last Modified: Fri; 15 Sep 2023; 07:04 CDT
# Description: Main configuration file for bash on macOS.

# DEBUG
# echo "in .bash_profile"

# ===================
# Initial Configurations
# ===================
# Set up Homebrew configurations
# eval "$(/opt/homebrew/bin/brew shellenv)"

# Disable 'Use ZSH' warning on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# ===================
# PATH Configurations
# ===================

# PATH Configurations have been added to .bashrc

# ===================
# Sourcing Additional Configurations
# ===================
# Source general bash configurations (for use with LINUX port)
[ -f ~/.bashrc ] && source ~/.bashrc

# No need to source .bash_prompt and .bash_aliases, they are already sourced in .bashrc

# ===================
# Miscellaneous
# ===================

# Launch terminal in tmux
# command -v tmux &> /dev/null && tmux

# Neofetch that hoe
# Pipe through lolcat for rainbow display
# command -v neofetch &> /dev/null && neofetch # | lolcat
