" .vimrc
" -------------------------------
" Date: 7 Aug 2023 19:32
" Author: Icko Iben
" Note: Some code taken from my professor at Baylor who freely shares this material.
"
" General usage notes:
" - To comment out any setting, prefix with a double-quote (`"`)
" - Make live changes in Vim using ":set XXX" where "XXX" is the desired setting
" - Re-open Vim after editing this file to see changes reflected

" Source Other Config Files
" -------------------------
" Autocommands
" Use Vim's ability to run shell commands to check existence of symlink target
if !empty(system("readlink -f ~/.vim/autocommands.vim"))
    source ~/.vim/autocommands.vim
endif

" GitHub Dark Color Scheme
" https://github.com/vv9k/vim-github-dark
if !empty(system("readlink -f ~/.vim/colors/ghdark.vim"))
    source ~/.vim/colors/ghdark.vim
endif

if !empty(system("readlink -f ~/.vim/config.vim"))
    source ~/.vim/config.vim
endif

" Plug-ins
"if !empty(system("readlink -f ~/.vim/plugins.vim"))
"    source ~/.vim/plugins.vim
"endif
