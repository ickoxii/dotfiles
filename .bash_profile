# Main configuration file for bash
# Sets paths
# calls other initialization files

# SET PATH
PATH="/usr/local/bin:$PATH"

# DISABLE 'USE ZSH' WARNING
eval "$(/opt/homebrew/bin/brew shellenv)"
export BASH_SILENCE_DEPRECATION_WARNING=1

neofetch            # of course

# CALL OTHER INITIALIZATION FILES
# call .bashrc only for interactive, non-login shells
# (Linux shit, idk, might be useful if I switch later)
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
source ~/.bash_prompt
source ~/.aliases # commented for now, change when .aliases is updated

# Add Visual Studio Code ('code' command recognized)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# pip commands
export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"

# Downloaded with docx2pdf
# tqdm, docx2pdf (see 'pip commands')
# export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"
