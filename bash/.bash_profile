# .bash_profile
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 03:03 CDT
# Description: Main configuration file for bash on macOS.

# ===================
# Initial Configurations
# ===================
# Set up Homebrew configurations
eval "$(/opt/homebrew/bin/brew shellenv)"

# Disable 'Use ZSH' warning on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# ===================
# PATH Configurations
# ===================
# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"

# Add Visual Studio Code CLI to PATH
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Include Python-related tools in PATH
export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"

# ===================
# Sourcing Additional Configurations
# ===================
# Source general bash configurations (for use with LINUX port)
[ -f ~/.bashrc ] && source ~/.bashrc

# No need to source .bash_prompt and .bash_aliases, they are already sourced in .bashrc

# ===================
# Miscellaneous
# ===================
# Display system information only if neofetch exists
# Pipe through lolcat for rainbow display
command -v neofetch &> /dev/null && neofetch # | lolcat  
