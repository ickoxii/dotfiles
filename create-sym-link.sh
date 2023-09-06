#!/opt/homebrew/bin/bash
## ======================
## Loop to create symlink
## ======================

create_symlink() {
    local src=$1
    local dest=$2

    # Check if the source file exists
    if [[ ! -e $src ]]; then
        echo "Warning: Source file $src does not exist. Skipped."
        return
    fi

    if [[ -L $dest ]]; then # Check if a symlink exists at the destination
        if [[ ! -e $dest ]]; then # Check if the symlink is dangling
            read -p "$dest is a dangling symlink. Do you want to remove and recreate it? [y/n] " choice
            case $choice in
                y|Y)
                    rm $dest && ln -s $src $dest
                    echo "Recreated symlink from $src to $dest"
                    ;;
                *)
                    echo "Skipped $dest"
                    ;;
            esac
        else
            echo "$dest symlink already exists and is not dangling. Skipped."
        fi
    else
        ln -s $src $dest && echo "Created symlink from $src to $dest"
    fi
}


## ===============================================
## Declare associative arrays for each application
## ===============================================

SOURCE="$HOME/.dotfiles/general-terminal"
DEST="$HOME"
declare -A GENERAL_TERMINAL=(
    ["$SOURCE/.profile"]="$DEST/.profile"
    ["$SOURCE/.hushlogin"]="$DEST/.hushlogin"
)

SOURCE="$HOME/.dotfiles/bash"
DEST="$HOME"
declare -A BASH=(
    ["$SOURCE/.bash_aliases"]="$DEST/.bash_aliases"
    ["$SOURCE/.bash_profile"]="$DEST/.bash_profile"
    ["$SOURCE/.bash_prompt"]="$DEST/.bash_prompt"
    ["$SOURCE/.bashrc"]="$DEST/.bashrc"
)

SOURCE="$HOME/.dotfiles/zsh"
DEST="$HOME"
declare -A ZSH=(
    ["$SOURCE/.zprofile"]="$DEST/.zprofile"
    ["$SOURCE/.zsh_aliases"]="$DEST/.zsh_aliases"
    ["$SOURCE/.zsh_prompt"]="$DEST/.zsh_prompt"
    ["$SOURCE/.zshrc"]="$DEST/.zshrc"
)

SOURCE="$HOME/.dotfiles/git"
DEST="$HOME"
declare -A GIT=(
    ["$SOURCE/.gitconfig"]="$DEST/.gitconfig"
)

SOURCE="$HOME/.dotfiles/vim"
DEST="$HOME"
declare -A VIM=(
    ["$SOURCE/.vimrc"]="$DEST/.vimrc"
    ["$SOURCE/autocommands.vim"]="$DEST/.vim/autocommands.vim"
)

SOURCE="$HOME/.dotfiles/vim/vim-templates"
DEST="$HOME/.vim/templates"
declare -A VIMTEMPLATES=(
    ["$SOURCE/gitignore-template"]="$DEST/gitignore-template"
)

SOURCE="$HOME/.dotfiles/neofetch"
DEST="$HOME/.config/neofetch"
declare -A NEOFETCH=(
    ["$SOURCE/config.conf"]="$DEST/config.conf"
)

declare -A SPOTIFYCLI=(
    ["$HOME/.dotfiles/spotifyd/spotifyd.conf"]="$HOME/.config/spotifyd/spotifyd.conf"
    ["$HOME/.dotfiles/spotify-tui/config.yml"]="$HOME/.config/spotify-tui/config.yml"
)


## ==============================================================
## Loops to actually run the create_symlink function on all files
## ==============================================================

echo "Linking GENERAL TERMINAL config files..."
for src in "${!GENERAL_TERMINAL[@]}"; do
    create_symlink "$src" "${GENERAL_TERMINAL[$src]}"
done
echo

echo "Linking BASH config files..."
for src in "${!BASH[@]}"; do
    create_symlink "$src" "${BASH[$src]}"
done
echo

echo "Linking ZSH config files..."
for src in "${!ZSH[@]}"; do
    create_symlink "$src" "${ZSH[$src]}"
done
echo

echo "Linking GIT config files..."
for src in "${!GIT[@]}"; do
    create_symlink "$src" "${GIT[$src]}"
done
echo

echo "Linking VIM config files..."
for src in "${!VIM[@]}"; do
    create_symlink "$src" "${VIM[$src]}"
done
echo

echo "Linking VIM templates..."
for src in "${!VIMTEMPLATES[@]}"; do
    create_symlink "$src" "${VIMTEMPLATES[$src]}"
done
echo

echo "Linking NEOFETCH config files..."
for src in "${!NEOFETCH[@]}"; do
    create_symlink "$src" "${NEOFETCH[$src]}"
done
echo

echo "Linking SPOTIFYCLI config files..."
for src in "${!SPOTIFYCLI[@]}"; do
    create_symlink "$src" "${SPOTIFYCLI[$src]}"
done
echo

