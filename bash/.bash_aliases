#!/opt/homebrew/bin/bash

# .bash_aliases
# Author: Icko Iben
# Created on: Mon; 4 Sep 2023; 03:02 CDT
# Last Modified: Fri; 15 Sep 2023; 07:04 CDT
# Description: Contains aliases to streamline command usage on macOS.
# Source: https://medium.com/@charlesdobson/how-to-customize-your-macos-terminal-7cce5823006e

# DEBUG
# echo "in .bash_aliases"

# ===================
# Finder Configurations
# ===================

# Show or hide hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Show or hide desktop icons
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"


# =================
# Command Shortcuts
# =================

# bat is a nicer formatted cat cli
# brew install bat
# alias cat="bat"

# =====================
# Application Shortcuts
# ---------------------
# Save nicknames for common applications to open.
# =====================

# Use Homebrew's updated bash instead of macOS default
alias bash="/opt/homebrew/bin/bash"

# Launch MATLAB CLI
alias mat="/Applications/matlab_r2023a.app/bin/matlab -nojvm -nodesktop"

# Default Browser
alias browser="open -a Brave\ Browser"

# Microsoft Word
alias winword="open -a Microsoft\ Word"

# Microsoft OneNote
alias onenote="open -a Microsoft\ OneNote"

# ======================
# Open Browser Bookmarks
# ======================

# ========
# DEFAULTS
# --------

# Default Email
alias email="browser https://gmail.com"
# ========


# Canvas
alias canvas="browser https://canvas.web.baylor.edu"

# Baylor Program Upload Site
alias upload="browser https://csi-info.baylor.edu/upload/"

# Pawprints
alias pawprints="browser https://print.baylor.edu/user"

# Google Calendar
alias googlecal="browser https://calendar.google.com/calendar/u/0/r"

# Gmail
alias gmail="browser https://gmail.com"

# Proton Mail
alias proton="browser https://proton.me"

# GitHub
alias gh="browser https://github.com/ickoxii"

# LeetCode
alias lc="browser https://leetcode.com/problemset/all/"

# DIM
alias dim="browser https://beta.destinyitemmanager.com/4611686018486746069/d2/inventory"

# Bungie LFG
alias lfg="browser https://www.bungie.net/7/en/Fireteams/Search?platform=0&activity=0"

# Instagram
alias ig="browser https://instagram.com"

# ASCII Flow Infinite Canvas
alias asciiflow="browser https://asciiflow.com/#/"


# ===================
# Miscellaneous 
# ===================

# Caution: Aliasing default commands might be risky. Only uncomment when sure about the implications!
# Alias to ask for confirmation when deleting files
# alias rm="rm -i"
# Alias for moving items to trash with confirmation
# alias trash="trash -i"
