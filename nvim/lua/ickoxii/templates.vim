" Templates
" =========

" newgitignore
" Creates a `.gitignore` file from template
" Usage: `vim newgitignore` from command line
" autocmd BufNewFile newgitignore 0r ~/skeleton-files/gitignore.template

" newtodo
" Creates a `TODO.md` file from template
" Usage: `vim newtodo` from command line
" autocmd BufNewFile newtodo 0r ~/skeleton-files/TODO.template

" new template for baylor csi projects
" includes pre-file comments and pre-function comments
" Usage: `vim newbaylorcsi` from command line
autocmd BufNewFile newbaylorcsi 0r ~/skeleton-files/baylorcsi.template

" cpp Makefile
" Usage: `vim newcppmake`
" autocmd BufNewFile newcppmake 0r ~/skeleton-files/Makefile.cpp.template

" pandoc Makefile
" Usage: `vim newpandocmake`
autocmd BufNewFile newpandocmake 0r ~/skeleton-files/Makefile.pandoc.template

" competitive coding template
autocmd BufNewFile newcodingcomp 0r ~/skeleton-files/coding-comp.cpp
