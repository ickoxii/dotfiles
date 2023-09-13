# .bashrc
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 16:08 CDT
# Description: Bash configurations that apply for both interactive and non-interactive shells.

# ===================
# PATH Configurations
# ===================
# Ensure user-installed binaries take precedence
# export PATH="/usr/local/bin:$PATH"

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

# Load aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# Load bash prompt customizations
[ -f ~/.bash_prompt ] && source ~/.bash_prompt

# Load bash functions
[ -f ~/.bash_functions ] && source ~/.bash_functions
