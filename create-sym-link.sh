#!/opt/homebrew/bin/bash

# Loop to create symlink

create_symlink() {
  local src=$1
  local dest=$2

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

# Declare associative arrays for each application

declare -A GENERAL_TERMINAL=(
  ["$HOME/.dotfiles/.profile"]="$HOME/.profile"
  ["$HOME/.dotfiles/.hushlogin"]="$HOME/.hushlogin"
)

declare -A BASH=(
  ["$HOME/.dotfiles/bash/.bash_aliases"]="$HOME/.bash_aliases"
  ["$HOME/.dotfiles/bash/.bash_profile"]="$HOME/.bash_profile"
  ["$HOME/.dotfiles/bash/.bash_prompt"]="$HOME/.bash_prompt"
  ["$HOME/.dotfiles/bash/.bashrc"]="$HOME/.bashrc"
)

declare -A ZSH=(
    ["$HOME/.dotfiles/zsh/.zprofile"]="$HOME/.zprofile"
    ["$HOME/.dotfiles/zsh/.z_aliases"]="$HOME/.zsh_aliases"
    ["$HOME/.dotfiles/zsh/.z_prompt"]="$HOME/.zsh_prompt"
    ["$HOME/.dotfiles/zsh/.zshrc"]="$HOME/.zshrc"
)

declare -A GIT=(
    ["$HOME/.dotfiles/.gitconfig"]="$HOME/.gitconfig"
)

declare -A VIM=(
    ["$HOME/.dotfiles/vim/.vimrc"]="$HOME/.vimrc"
    ["$HOME/.dotfiles/vim/autocommands.vim"]="$HOME/.vim/autocommands.vim"
    ["$HOME/.dotfiles/vim/vim-templates/gitignore-template"]="$HOME/.vim/templates/gitignore-template"
)

declare -A NEOFETCH=(
    ["$HOME/.dotfiles/neofetch/config.conf"]="$HOME/.config/neofetch/config.conf"
)

declare -A SPOTIFYCLI=(
    ["$HOME/.dotfiles/spotifyd/spotifyd.conf"]="$HOME/.config/spotifyd/spotifyd.conf"
    ["$HOME/.dotfiles/spotify-tui/config.yml"]="$HOME/.config/spotify-tui/config.yml"
)

# Loops to actually run the create_symlink function on all files

echo "Linking GENERAL TERMINAL config files..."
for src in "${!GENERAL_TERMINAL[@]}"; do
  create_symlink "$src" "${GENERAL_TERMINAL[$src]}"
done

echo "Linking BASH config files..."
for src in "${!BASH[@]}"; do
  create_symlink "$src" "${BASH[$src]}"
done

echo "Linking ZSH config files..."
for src in "${!ZSH[@]}"; do
    create_symlink "$src" "${ZSH[$src]}"
done

echo "Linking GIT config files..."
for src in "${!GIT[@]}"; do
    create_symlink "$src" "${GIT[$src]}"
done

echo "Linking VIM config files..."
for src in "${!VIM[@]}"; do
  create_symlink "$src" "${VIM[$src]}"
done

echo "Linking NEOFETCH config files..."
for src in "${!NEOFETCH[@]}"; do
  create_symlink "$src" "${NEOFETCH[$src]}"
done

echo "Linking SPOTIFYCLI config files..."
for src in "${!SPOTIFYCLI[@]}"; do
  create_symlink "$src" "${SPOTIFYCLI[$src]}"
done

