# dotfiles

Author: Icko Iben  

These are my dotfiles for various CLI's and macOS applications. This repository
contains directories for each application. The organization of each application
simulates the organization of its respective dotfiles in relation to the users
$HOME directory. I am too lazy to figure out gnu stow or other dotfile managers
so I have a shell script inside each directory in order to sym-link the dotfiles
for each application.

## Organization

This what our sym-links should look like (filenames ending in `@` are sym-links):

```
~
|_ .config/
|   |_ bash@/
|   |_ kitty@/
|   |_ zsh@/
|   |_ nvim@/
|_ .vim/
|   |_ config@/
|   |_ .colors@/
|_ .bash_profile@
|_ .bashrc@
|_ .hushlogin@
|_ .tmux.conf@
|_ .vimrc@
|_ .zshenv@
```
