# .bashrc
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 16:08 CDT
# Last Modified: Fri; 15 Sep 2023; 07:04 CDT
# Description: Bash configurations that apply for both interactive and non-interactive shells.

# DEBUG
# echo "in .bashrc"

# ===============================
# Default Terminal Configurations
# ===============================

# Launch in byobu by default
# use `byobu-enable` in command-line
# use `byobu-disable` in command-line to return to default emulator

# ================
# GLOBAL Variables
# ================



# ===================
# PATH Configurations
# ===================
# Ensure user-installed binaries take precedence
# export PATH="/usr/local/bin:$PATH"

# Set up Homebrew configurations
eval "$(/opt/homebrew/bin/brew shellenv)"

# Ensure brew-installed binaries take precedence
export PATH="$PATH:/opt/homebrew/bin"

# Add Visual Studio Code CLI to PATH
# Necessary when installed from browser
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Include Python-related tools in PATH
export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"

# ===================
# Sourcing Additional Configurations
# ===================

# Expand aliases when used in the following files
# shopt -s expand_aliases

# Load aliases
[ -f ~/.config/bash/.bash_aliases ] && source ~/.config/bash.bash_aliases

# Load bash functions
[ -f ~/.config/bash/.bash_functions ] && source ~/.config/bash/.bash_functions

# Load bash prompt customizations
[ -f ~/.config/bash/.bash_prompt ] && source ~/.config/bash/.bash_prompt
