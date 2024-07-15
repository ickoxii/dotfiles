# File: .zprofile
# Author: Icko Iben
# Date Created: 14 November 2023
# Date Last Modified: 14 July 2024
# 
# Sourced only for login shell
# 
# On macOS, it is recommended to set path variables in .zprofile to avoid
# potential conflicts with the system's path helper.

#==============================================================================#
# >>>> Paths >>>>
#==============================================================================#

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Maven
export M2_HOME="/Users/ickoxii/Packages/apache-maven-3.9.6"
export PATH="${M2_HOME}/bin:${PATH}"

# JAVA_HOME (for JDK)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

# ZSH completions for pass
FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH

# GO!
export PATH="/usr/local/go/bin:${PATH}"

# My scripts
# export PATH="/Users/ickoxii/.local/scripts:${PATH}"


