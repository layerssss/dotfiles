" Dvorak remap
" 1 - Movement keys htns -> hjkl
"   (gj and gk move by visual lines, if the line is wrapped for instance)
noremap h h
noremap t gj
noremap n gk
noremap s l
syntax on

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END
