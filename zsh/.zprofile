# .zprofile
# Author: Icko Iben
# Created on: [Insert Creation Date, e.g., "7 Aug 2023"]
# Description: Main configuration file for zsh on macOS.

# ===================
# Initial Configurations
# ===================
# Set up Homebrew configurations
# eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Load prompt customizations
[ -f ~/.zsh_prompt ] && source ~/.zsh_prompt

# Load aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# ===================
# Miscellaneous
# ===================
# Display system information
neofetch

