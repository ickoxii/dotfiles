#==============================================================================#

# >>>> p10k configuration >>>>

# Turn off the god-forsaken beeping
unsetopt BEEP
# (only autocomplete beeps)
# unsetopt LIST_BEEP

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
 
source $ZDOTDIR/.oh-my-zshrc
 
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/zsh/.p10k.zsh

# Set theme
ZSH_THEME="common"

# <<<< p10k configuration <<<<

#==============================================================================#

# >>>> My Configurations >>>>

# Move location of zcompdump files
# $ZSH = ~/.oh-my-zsh/
export ZSH_COMPDUMP=~/.zsh-cache/.zcompdump-$HOST

# Source aliases
[[ ! -f ~/.dotfiles/zsh/zsh/.zaliases ]] || source ~/.dotfiles/zsh/zsh/.zaliases

# Source other options (themes, cli tool customizations)
[[ ! -f ~/.dotfiles/zsh/zsh/.zshoptions ]] || source ~/.dotfiles/zsh/zsh/.zaliases

# Loading prompt is not needed, we are using p10k (see above)
# [[ ! -f ~/.dotfiles/zsh/zsh/.zprompt ]] || source ~/.dotfiles/zsh/zsh/.zprompt

# <<<< My Configurations <<<<

#==============================================================================#
