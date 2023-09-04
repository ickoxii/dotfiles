# ----------------------------------------
# File: .zshrc
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 02:48
# Description: Contains Zsh configurations primarily for interactive sessions on macOS.
# Source: https://medium.com/@charlesdobson/how-to-customize-your-macos-terminal-7cce5823006e
# ----------------------------------------

# ===================
# Utility Functions
# ===================
# Display current GIT branch (if inside a git repository)
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# ===================
# Prompt Customization
# ===================

# Define prompt appearance components
PROMPT="%{$fg[red]%}%n%{$reset_color%} "            # username
PROMPT+="%{$fg[magenta]%}%1~%{$reset_color%} "     # current directory
PROMPT+="%{$fg[cyan]%}\$(git_branch)%{$reset_color%} "  # current git branch (if applicable)

# Adjust prompt symbol based on user privileges
if [ "$UID" -ne 0 ]; then
    PROMPT+=">> "
else
    PROMPT+="$ "
fi
