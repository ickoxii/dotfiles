" Date Created: 11 October 2023
" Contains actual configuration for vim



" ----------
" Appearance
" ----------

" colorscheme slate              " Vim default color scheme

" Aldiun Color Scheme
" -------------------
" https://github.com/rafi/awesome-vim-colorschemes
" https://github.com/AlessandroYorba/Alduin

" GitHub Dark Color Scheme
" ------------------------
let g:gh_color = "soft"         " Use soft version


" ---------
" Interface
" ---------

set backspace=2         " Backspace does not work on brew installed vim on macOS

syntax on               " Turn on syntax highlighting

set mouse=a             " Enable mouse support

set laststatus=2        " Always show a status line at the bottom

" set relativenumber      " Display line numbers as offset from the current
" set number              " Display absolute line numbers
set number relativenumber " Display current line with others as offset from curr

set laststatus=2        " Always show status line
set statusline=%l,%c%=%P    " Print current line, column, position in file as a percentage

set textwidth=80        " Set buffer wrapping width to 80 characters

" set wrap                " Enable text wrapping at window size

" Uncomment below to disable text wrapping
" set textwidth=0


" ---------------
" Search Settings
" ---------------

set hlsearch            " Highlight all occurrences of a search term

" Incremental search - highlight matches as you type
" set incsearch

" By default, ignore case during searches
" set ignorecase
set noignorecase    " Vim default (search is case sensitive)
" set smarcase      " Case sensitive search ONLY if search term
                    " contains upper case characters


" ------------------------
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


" -------------
" Misc Settings
" -------------
" Disable the Vim alert bell for all events (your sanity will thank you)
set belloff=all
