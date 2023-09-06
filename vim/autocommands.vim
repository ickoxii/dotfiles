" Creates a `.gitignore` file from template
" Usage: `vim newgitignore` from command line
autocmd BufNewFile newgitignore 0r ~/.vim/templates/gitignore.template

" Creates a `TODO.md` file from template
" Usage: `vim newtodo` from command line
autocmd BufNewFile newtodo 0r ~/.vim/templates/TODO.template
