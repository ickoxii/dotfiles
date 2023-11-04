" .vimrc
" -------------------------------
" Date: 7 Aug 2023 19:32
" Author: Icko Iben
" Note: Some code taken from my professor at Baylor who freely shares this material.
" Addendum: Since then, I have made numerous additions and modifications to
" .vimrc and associated files such that they barely represent my professors
" initial vimrc.
"
" General usage notes:
" - To comment out any setting, prefix with a double-quote (`"`)
" - Make live changes in Vim using ":set XXX" where "XXX" is the desired setting
" - Re-open Vim after editing this file to see changes reflected


" ================
" Startup Settings
" ================
" PandocMarkdown active on open?
let g:enable_pandoc_markdown=0      " 0 - disable | 1 - enable


" =========================
" Source Other Config Files
" -------------------------
" We only source configuration files if they exist. This is why we have the
" if !empty() check. 
"
" The `system` function runs the command passed into it through a shell and 
"   return the output as a string.
"
" This is why we pass the result of the `system` function through `empty`.
" `empty` is a vim function that checks if the given value is empty. For
" strings, it returns 0 if empty, 1 otherwise.
"
" `readlink` is a Unix command that retrieves the target of a symbolic link.
" In this case, the `-f` flag is not force, but instead tells `readlink` to
" canonicalize the path by following every symlink in every component of 
" the given path and remove the '..' '.' components. If the given path is 
" a file or symlink to a file, it will return the absolute path of the file.
" If the file does not exist, it will return an empty string.
"
" i.e. `if !empty(system("readlink -f path/goes/here"))` is a conditional
" check which takes a symlink (or file), canonicalizes the absolute path
" to the file, and sources this file if it exists.
" =========================
" Vim Settings
if !empty(system("readlink -f ~/.vim/config.vim"))
    source ~/.vim/config.vim
endif

" Autocommands
if !empty(system("readlink -f ~/.vim/autocmds.vim"))
    source ~/.vim/autocmds.vim
endif

" GitHub Dark Color Scheme
" https://github.com/vv9k/vim-github-dark
if !empty(system("readlink -f ~/.vim/colors/ghdark.vim"))
    source ~/.vim/colors/ghdark.vim
endif

" Plug-ins
"if !empty(system("readlink -f ~/.vim/plugins.vim"))
"    source ~/.vim/plugins.vim
"endif
