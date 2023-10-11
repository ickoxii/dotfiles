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

" Use soft version
let g:gh_color = "soft"

" Plug-ins
"if !empty(system("readlink -f ~/.vim/plugins.vim"))
"    source ~/.vim/plugins.vim
"endif

" Appearance & Interface
" ----------------------

" Aldiun Color Scheme
" https://github.com/rafi/awesome-vim-colorschemes
" https://github.com/AlessandroYorba/Alduin
" let g:alduin_Shout_Dragon_Aspect = 1  " Almost Black Background
" let g:alduin_Shout_Become_Ethereal = 1 " Black Background
" let g:alduin_Shout_Fire_Breath = 1  " Adds Deep Red Color for special
                                    " highlighting groups
" let g: alduin_Shout_Aura_Whisper = 1  " removes block matchparens setting and
                                        " adds an underline
" colorscheme alduin      " Dark Grey

" Color Scheme (vim default)
" colorscheme slate

" Backspace does not work on brew installed vim on macOS
set backspace=2

" Turn on syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" Highlight all occurrences of a search term
set hlsearch

" Always show a status line at the bottom
set laststatus=2

" Display relative line numbers (comment out to show absolute line numbers)
set relativenumber
" set number

" Set buffer wrapping width to 80 characters
set textwidth=80

" Enable text wrapping at window size
" set wrap

" Uncomment below to disable text wrapping
" set textwidth=0

" Search Settings
" ---------------
" Incremental search - highlight matches as you type
set incsearch

" By default, ignore case during searches
" set ignorecase
set noignorecase    " Vim default (search is case sensitive)
" set smarcase      " Case sensitive search ONLY if search term
                    " contains upper case characters

" Indentation & Formatting
" ------------------------
" Use spaces instead of tabs, set indentation width to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Auto-indent based on C-style blocks
set autoindent
set cindent " provides automatic indentation for c-style languages

" Adjust class visibility modifiers to align with class keyword
set cinoptions=g0

" Function/Class definitions always begin 4 spaces indented
" set cinoptions+=(4

" Guarantee K&R format for switch-case statements
" set cinoptions+=:0 " already default setting for vim

" System Integration
" ------------------
" Yank to the system clipboard by default (macOS)
" Otherwise, yank to clipboard using `"*y`
set clipboard=unnamed

" Misc Settings
" -------------
" Disable the Vim alert bell for all events (your sanity will thank you)
set belloff=all
