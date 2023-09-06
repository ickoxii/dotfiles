" Creates a .gitignore file from template
" Usage: `vim newgitignore` from command line
autocmd BufNewFile newgitignore 0r ~/.vim/templates/gitignore-template
