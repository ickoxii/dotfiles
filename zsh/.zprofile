# .zprofile
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 02:44
# Description: Main configuration file for zsh on macOS.
# A .profile is used for a login shell. This is the place for:
#   Environment variables (`PATH`, `PS1`, etc)
#   Startup programs that should run when you log in
#   Any initialization related to sessions

# ===================
# Initial Configurations
# ===================
# Set up Homebrew configurations
eval "$(/opt/homebrew/bin/brew shellenv)"

# ===================
# PATH Configurations
# ===================
# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"

# Add Visual Studio Code CLI to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Include Python-related tools in PATH
export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"

# ===================
# Sourcing Additional Configurations
# ===================
# Source zsh configurations (If you have general configurations separate from .zshrc)
# [ -f ~/.zshconfig ] && source ~/.zshconfig

# Load configurations
[ -f ~/.zshrc ] && source ~/.zshrc

# Load prompt customizations
[ -f ~/.zsh_prompt ] && source ~/.zsh_prompt

# Load aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# ===================
# Miscellaneous
# ===================
# Display system information if neofetch is available
command -v neofetch &>/dev/null && neofetch
