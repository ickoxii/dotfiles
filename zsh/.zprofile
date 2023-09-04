# Main configuration file for zsh
# Sets paths
# calls other initialization files

# SET PATH
export PATH="/usr/local/bin:$PATH"

# For Homebrew's environment
eval "$(/opt/homebrew/bin/brew shellenv)"

neofetch            # of course

# CALL OTHER INITIALIZATION FILES
# call .zshrc only for interactive, non-login shells
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi
source ~/.zsh_prompt
source ~/.zsh_aliases 

# Add Visual Studio Code ('code' command recognized)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# pip commands
export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"

# Uncomment the next line when needed
# export PATH="$PATH:/Users/ickoxii/Library/Python/3.9/bin"
