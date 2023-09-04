" 7 Aug 2023 19:32
" author: Icko Iben
" some code taken from my professor at Baylor
" to my knowledge, he freely gives this material out

" To comment anything out, just put a double-quote in front. 
" Feel free to play with this file (but re-open vim when you make a change to
" see the change reflected). You can make changes when editing using ":set XXX"
" where XXX is the setting you want to change.


" Set the wrapping width (# of characters) of your buffer. (A buffer is the
" thing you're editing, which may be a file or just an unsaved thing.)
" set textwidth=100

" This would cause the buffer to never wrap -- which is usually what I do when programming.
set textwidth=0

" Tell vim to use syntax highlighting.
syntax on

" Tell vim to automatically indent on C-style blocks, etc.
" Sets private: and public: to same indent as class
set autoindent
set cindent
set cinoptions=g-1

" Turn tabs into 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Incremental searching -- highlight matches while searching.
set incsearch

" Ignore case when searching -- turn this off with ":set noignorecase"
" set ignorecase
set noignorecase

" Highlight all occurrences of a search term.
set hlsearch

" Always keep a status line at the bottom of the screen.
set laststatus=2

" Show line numbers
set number

" Surround comments with asterisks
set formatoptions+=r

" Turn off vim alert bell
set belloff=all
