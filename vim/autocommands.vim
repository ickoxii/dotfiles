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
autocmd BufNewFile newbaylorcsi 0r ~/.vim/templates/baylorcsi.template

" Comment Formatting
" ==================

" Autocommands
" ============

" Markdown Live Previewer Helper
" Vim autocommand to touch /tmp/bufwrite upon saving a Markdown file
" This triggers the onmodify function (when used) to perform its actions
" au BufWritePost *.md !touch /tmp/bufwrite

augroup PandocMarkdown
    autocmd!
    autocmd BufWritePost *.md !pandoc % --pdf-engine=xelatex -H ~/.dotfiles-and-scripts/latex/preambles/math.tex --highlight-style=breezedark -o %<.pdf
augroup END

" Define the Pandoc command
" command! Pandoc w | !pandoc % --pdf-engine=xelatex -H ~/.dotfiles-and-scripts/latex/preambles/math.tex --highlight-style=breezedark -o %<.pdf
