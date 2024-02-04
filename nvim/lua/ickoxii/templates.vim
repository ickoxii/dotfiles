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
