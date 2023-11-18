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
SRCBASE="$HOME/.dotfiles"

# CLANGD
# ------
SOURCE="$SRCBASE/clangd"
DEST="$HOME/.config"
declare -A CLANGD=(
    ["$SOURCE"]="$DEST"
)

# GENERAL_TERMINAL
# ----------------
SOURCE="$SRCBASE/general-terminal"
DEST="$HOME"
declare -A GENERAL_TERMINAL=(
    ["$SOURCE/.profile"]="$DEST/.profile"
    ["$SOURCE/.hushlogin"]="$DEST/.hushlogin"
)

# PACKAGE_MANAGERS
# ----------------
SOURCE="$SRCBASE/package-managers"
DEST="$HOME"
declare -A PACKAGE_MANAGERS=(
    ["$SOURCE/get-pip.py"]="$DEST/get-pip.py"
)

# NVIM
# ----------------
SOURCE="$SRCBASE/nvim"
DEST="$HOME/.config"
declare -A NVIM=(
    ["$SOURCE"]="$DEST"
)

# BASH
# ----
SOURCE="$SRCBASE/bash"
DEST="$HOME"
declare -A BASH=(
    ["$SOURCE/.bash_aliases"]="$DEST/.bash_aliases"
    ["$SOURCE/.bash_functions"]="$DEST/.bash_functions"
    ["$SOURCE/.bash_profile"]="$DEST/.bash_profile"
    ["$SOURCE/.bash_prompt"]="$DEST/.bash_prompt"
    ["$SOURCE/.bashrc"]="$DEST/.bashrc"
)

# ZSH
# ---
SOURCE="$SRCBASE/zsh"
DEST="$HOME/.config"
declare -A ZSH=(
    ["$SOURCE/.zshenv"]="$HOME/.zshenv"
    ["$SOUCE/zsh"]="$DEST"
)

# GIT
# ---
SOURCE="$SRCBASE/git"
DEST="$HOME"
declare -A GIT=(
    ["$SOURCE/.gitconfig"]="$DEST/.gitconfig"
)

# VIM
# ---
SOURCE="$SRCBASE/vim"
DEST="$HOME"
declare -A VIM=(
    ["$SOURCE/.vimrc"]="$DEST/.vimrc"
    ["$SOURCE/autocmds.vim"]="$DEST/.vim/autocmds.vim"
    ["$SOURCE/plugins.vim"]="$DEST/.vim/plugins.vim"
    ["$SOURCE/colors"]="$DEST/.vim/"
    ["$SOURCE/config.vim"]="$DEST/.vim/config.vim"
)

# VIM TEMPLATES
# -------------
SOURCE="$SRCBASE/skeleton-files"
DEST="$HOME/"
declare -A VIM_TEMPLATES=(
    ["$SOURCE"]="$DEST"
)


# LATEX PREAMBLES
# ---------------
SOURCE="$SRCBASE/latex/"
DEST="$HOME/.config/"
declare -A LATEX_TEMPLATES=(
    ["$SOURCE"]="$DEST"
)

# NEOFETCH
# --------
SOURCE="$SRCBASE/neofetch"
DEST="$HOME/.config/"
declare -A NEOFETCH=(
    ["$SOURCE"]="$DEST"
)

# SPOTIFYCLI
# ----------
declare -A SPOTIFYCLI=(
    ["$SRCBASE/spotifyd"]="$HOME/.config/"
    ["$SRCBASE/spotify-tui"]="$HOME/.config/"
)

# TMUX Configuration
# ------------------
declare -A TMUX=(
    ["$SRCBASE/tmux/.tmux.conf"]="$HOME/.tmux.conf"
)


## ==============================================================
## Loops to actually run the create_symlink function on all files
## ==============================================================

echo "Linking clangd config files..."
for src in "${!CLANGD[@]}"; do
    create_symlink "$src" "${CLANGD[$src]}"
done
echo

echo "Linking GENERAL-TERMINAL config files..."
for src in "${!GENERAL_TERMINAL[@]}"; do
    create_symlink "$src" "${GENERAL_TERMINAL[$src]}"
done
echo

echo "Linking PACKAGE-MANAGERS..."
for src in "${!PACKAGE_MANAGERS[@]}"; do
    create_symlink "$src" "${PACKAGE_MANAGERS[$src]}"
done
echo

echo "Linking NVIM..."
for src in "${!NVIM[@]}"; do
    create_symlink "$src" "${NVIM[$src]}"
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
for src in "${!VIM_TEMPLATES[@]}"; do
    create_symlink "$src" "${VIM_TEMPLATES[$src]}"
done
echo

echo "Linking LaTeX preambles..."
for src in "${!LATEX_TEMPLATES[@]}"; do
    create_symlink "$src" "${LATEX_TEMPLATES[$src]}"
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

echo "Linking TMUX config files..."
for src in "${!TMUX[@]}"; do
    create_symlink "$src" "${TMUX[$src]}"
done
echo
