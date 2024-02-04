#==============================================================================#

# >>>> p10k configuration >>>>
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
 
source $ZDOTDIR/.oh-my-zshrc
 
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Set theme
ZSH_THEME="common"

# <<<< p10k configuration <<<<

#==============================================================================#

# >>>> My Configurations >>>>

# Turn off the god-forsaken beeping
unsetopt BEEP
unsetopt LIST_BEEP

# Move location of zcompdump files
# $ZSH = ~/.oh-my-zsh/
export ZSH_COMPDUMP=~/.zsh-cache/.zcompdump-$HOST

# Source aliases
[[ ! -f $ZDOTDIR/.zaliases ]] || source $ZDOTDIR/.zaliases

# Source other options (themes, cli tool customizations)
[[ ! -f $ZDOTDIR/.zshoptions ]] || source $ZDOTDIR/.zshoptions

# Load custom prompt
# [[ ! -f $ZDOTDIR/.zprompt ]] || source $ZDOTDIR/.zprompt

# <<<< My Configurations <<<<

#==============================================================================#

# >>>> Paths >>>>

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Maven
export M2_HOME="/Users/ickoxii/Packages/apache-maven-3.9.6"
export PATH="${M2_HOME}/bin:${PATH}"

# JAVA_HOME (for JDK)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

# <<<< Paths <<<<
