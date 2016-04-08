" Dvorak remap
" 1 - Movement keys htns -> hjkl
"   (gj and gk move by visual lines, if the line is wrapped for instance)
noremap h h
noremap t gj
noremap n gk
noremap s l
" 2 - replace functions we remapped away
"   S goes to bottom of Screen
noremap S L
"   j/J Jerk and replace a character/line
noremap j s
noremap J S
"   k/K Keep searching through regex matches
noremap k n
noremap K N
"   l/L Looks forward/backward to a 
noremap l t
noremap L T
"   T   puts lines Together
noremap T J

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END
