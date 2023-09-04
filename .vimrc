" Metadata and general information
" -------------------------------
" Date: 7 Aug 2023 19:32
" Author: Icko Iben
" Note: Some code taken from my professor at Baylor who freely shares this material.
"
" General usage notes:
" - To comment out any setting, prefix with a double-quote (`"`)
" - Make live changes in Vim using ":set XXX" where "XXX" is the desired setting
" - Re-open Vim after editing this file to see changes reflected

" Appearance & Interface
" ----------------------
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

" Set buffer wrapping width to 120 characters
set textwidth=120
" Uncomment below to disable text wrapping
" set textwidth=0
set wrap

" Search Settings
" ---------------
" Incremental search - highlight matches as you type
set incsearch

" By default, ignore case during searches
" set ignorecase
set noignorecase

" Indentation & Formatting
" ------------------------
" Use spaces instead of tabs, set indentation width to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Auto-indent based on C-style blocks
set autoindent
set cindent

" Adjust class visibility modifiers to align with class keyword
set cinoptions=g-1

" Special handling for C-style comments
augroup my_comment_settings
    autocmd!
    autocmd FileType c,cpp setlocal comments=sr:/*,mb:*,ex:*/,://
augroup END

" System Integration
" ------------------
" Yank to the system clipboard by default (macOS)
set clipboard=unnamed

" Misc Settings
" -------------
" Disable the Vim alert bell for all events (your sanity will thank you)
set belloff=all
