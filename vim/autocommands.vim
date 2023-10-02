" Templates
" =========

" newgitignore
" Creates a `.gitignore` file from template
" Usage: `vim newgitignore` from command line
autocmd BufNewFile newgitignore 0r ~/.vim/templates/gitignore.template

" newtodo
" Creates a `TODO.md` file from template
" Usage: `vim newtodo` from command line
autocmd BufNewFile newtodo 0r ~/.vim/templates/TODO.template

" new template for baylor csi projects
" includes pre-file comments and pre-function comments
" Usage: `vim newbaylorcsi` from command line
autocmd BufNewFile newbaylorcsi 0r ~/.vim/templates/baylorcsi.template

" Comment Formatting
" ==================

" C-style comment formatting
"augroup c_comment_settings
"    autocmd!
"    autocmd FileType c,cpp setlocal formatoptions+=ro
"    autocmd FileType c,cpp setlocal formatoptions-=r
"    autocmd FileType c,cpp setlocal comments=s1:/*,mb:*,ex:*/
"augroup END


" Autocommands
" ============

" Markdown Live Previewer Helper (depreciated version)
" Vim autocommand to touch /tmp/bufwrite upon saving a Markdown file
" This triggers the onmodify function (when used) to perform its actions
" au BufWritePost *.md !touch /tmp/bufwrite

" Markdown Live Preview Helper
" Vim autocommand to pandoc current file upon write if the current file is .md
augroup PandocMarkdown
    autocmd!
    autocmd BufWritePost *.md !pandoc % --pdf-engine=xelatex -H ~/.dotfiles-and-scripts/latex/preambles/math.tex --highlight-style=breezedark -o %<.pdf
augroup END
