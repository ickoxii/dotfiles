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

" Appearance & Interface
" ----------------------
" Backspace does not work on brew installed vim on macOS
set backspace=2

" Turn on syntax highlighting
syntax on

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif

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
set noignorecase

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
set cinoptions+=(4

" Guarantee K&R format for switch-case statements
set cinoptions+=:0 " already default setting for vim

" System Integration
" ------------------
" Yank to the system clipboard by default (macOS)
set clipboard=unnamed

" Misc Settings
" -------------
" Disable the Vim alert bell for all events (your sanity will thank you)
set belloff=all

" Autocommands
" ------------
" Use Vim's ability to run shell commands to check existence of symlink target
if !empty(system("readlink -f ~/.vim/autocommands.vim"))
    source ~/.vim/autocommands.vim
endif
