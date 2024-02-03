# File: .zprofile
# Author: Icko Iben
# Date Created: 14 November 2023
# Date Last Modified: 14 November 2023
# 
# Sourced only for login shell
# 
# The sole purpose of this file is to source .zshrc in the case that a login
# shell is executed. This is to maintain compatability between different 
# shell environments
#
# ISSUE: 
# Having it setup in this way caused it so that .zshrc and the rest of my 
# zsh config was sourced twice. So potentially this is not needed

# What is my purpose?
# You source .zshrc
# Oh my god
# [[ ! -f $ZDOTDIR/.zshrc ]] || source $ZDOTDIR/.zshrc
