# TODO

Tracks planned changes such as features, bugs, improvements, etc.

## Features

1. Implement bash shell behavior for zsh
    - .zprofile
    - .zsh\_aliases
    - .zsh\_prompt
    - .zshrc

## Bugs

1. Various unintended auto-indent behavior caused by configurations in .vimrc
    - multi-line comments no longer begin with '\*'

## Improvements

1. Find out how to customize neofetch image
    - source .txt
    - source .png

2. Add aliases for opening applications in .bash\_aliases

3. Split vim autocommands based on file type, especially for comment handling
configurations. 
    - one file for file template calls
    - one file for .c,.cpp comments, one file for .m comments

4. Add templates to vim
    - .tex
    - leetcode questions
    - .cpp with prefile comments for baylor projects

## Misc

1. configure spotifyd. needed to download the following packages through brew:
    - dbus
    - pkg-config
    - portaudio
    - pass

2. `pass`
pass is a command line password manager. I may be able to use it to
pass passwords through the spotifyd config file so I do not have to
store my username or password in plain text.

3. Make sure spotify-tui is able to use spotifyd as a device
