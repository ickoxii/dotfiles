# .bash_aliases
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 03:02 CDT
# Description: Contains aliases to streamline command usage on macOS.
# Source: https://medium.com/@charlesdobson/how-to-customize-your-macos-terminal-7cce5823006e

# ===================
# Finder Configurations
# ===================

# Show or hide hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Show or hide desktop icons
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# ===================
# Application Shortcuts
# ===================

# Launch MATLAB with specific settings
alias matlab="/Applications/matlab_r2023a.app/bin/matlab -nojvm -nodesktop"

# Use Homebrew's updated bash instead of macOS default
alias bash="/opt/homebrew/bin/bash"

# Launch Spotify
alias spotify="open -a Spotify"

# Launch Brave Browser
alias brave="open -a Brave\ Browser"

# Launch Google Chrome
alias chrome="open -a Google\ Chrome"

# ============
# Script Calls
# ============

# Markdown live previewer script
# Uses a combination of pandoc, entr, and a pdf viewer to render live changes
# made to (.md) files
alias
livepreview='$HOME/.dotfiles-and-scripts/bash/scripts/pandoc-live-markdown.sh"

# ===================
# Miscellaneous 
# ===================

# Caution: Aliasing default commands might be risky. Only uncomment when sure about the implications!
# Alias to ask for confirmation when deleting files
# alias rm="rm -i"
# Alias for moving items to trash with confirmation
# alias trash="trash -i"
