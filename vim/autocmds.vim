" File: autocommands.vim
" Author: Icko Iben
" Date Created: idk man
" Date Last Modified: 12 Oct 2023
" 
" File for autocommands in vim. These autocommands include opening template
" files and defining user commands.

" File Specific Commands
" ======================

" Turn off syntax highlighting for json files
autocmd BufRead,BufNewFile *.json syntax off

" Turn off expand tab for Markdown files
" (Makefiles require tabs)
autocmd FileType make setlocal noexpandtab

" Templates
" =========

" >>>> CPP stuff >>>>

" new template for baylor csi projects
autocmd BufNewFile newbaylorcsi 0r ~/skeleton-files/baylorcsi.cpp

" competitive coding template
autocmd BufNewFile newcodingcomp 0r ~/skeleton-files/coding-comp.cpp

" <<<< CPP stuff <<<<


" >>>> Java stuff >>>>

" Parent pom for Maven project
autocmd BufNewFile newparentpom 0r ~/skeleton-files/pom.xml

" Makefile for building Maven projects
autocmd BufNewFile newmvnmake 0r ~/skeleton-files/mvnmake

" <<<< Java stuff <<<<

" >>>> Makefiles >>>>

" Makefile for cpp projects
" autocmd BufNewFile newcppmake 0r ~/skeleton-files/cppmake

" Makefile for linking latex math libraries and such for generating pdfs of
" markdown files
autocmd BufNewFile newpandocmake 0r ~/skeleton-files/pandocmake

" Makefile for small SDL projects
autocmd BufNewFile newsdlmake 0r ~/skeleton-files/sdlmake

" Dockerfile for valgrind testing
autocmd BufNewFile newvalgrind 0r ~/skeleton-files/dockervalgrind

" <<<< Makefiles <<<<

" Autocommands
" ============

" Use pandoc to generate a pdf of markdown files when saving
" Always define the PandocMarkdown augroup
augroup PandocMarkdown
    autocmd!
    if g:enable_pandoc_markdown
        " The autocmd is listed here, but it's only added if the variable is set.
        autocmd BufWritePost *.md !pandoc % --pdf-engine=xelatex -H ~/.config/latex/preambles/math.tex --highlight-style=breezedark -o %<.pdf
    endif
augroup END

" Command to enable the PandocMarkdown autocommands
command! EnablePandoc autocmd! PandocMarkdown | autocmd PandocMarkdown BufWritePost *.md !pandoc % --pdf-engine=xelatex -H ~/.config/latex/preambles/math.tex --highlight-style=breezedark -o %<.pdf

" Command to disable the PandocMarkdown autocommands
command! DisablePandoc autocmd! PandocMarkdown

" Function and command to toggle the PandocMarkdown autocommands
function! TogglePandoc()
    if exists("#PandocMarkdown#BufWritePost")
        " The autocmd exists, so we remove it
        autocmd! PandocMarkdown BufWritePost *.md
    else
        " The autocmd doesn't exist, so we add it
        autocmd PandocMarkdown BufWritePost *.md !pandoc % --pdf-engine=xelatex -H ~/.config/latex/preambles/math.tex --highlight-style=breezedark -o %<.pdf
    endif
endfunction

" Command to toggle PandocMarkdown autocommand
command! TogglePandoc call TogglePandoc()

" Shortcuts
command! EP EnablePandoc
command! DP DisablePandoc
command! TP call TogglePandoc()
