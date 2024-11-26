" File: remaps.vim
" Author: Icko Iben
" Date Created: 09/25/2024
"
" Modifed:          09/25/2024
"   - remap leader and local leader to space
"   - add mapping for :Ex

let mapleader = " "
let maplocalleader = " "

" Normal mode remaps
nnoremap <leader>pv :Ex<CR>
nnoremap j gj
nnoremap k gk

" Insert mode remaps

" Visual mode remaps
vnoremap j gj
vnoremap k gk
