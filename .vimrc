" Dvorak remap
" 1 - Movement keys htns -> hjkl
"   (gj and gk move by visual lines, if the line is wrapped for instance)
noremap h h
noremap t gj
noremap n gk
noremap s l

syntax on

filetype plugin indent on

set expandtab
set tabstop=2
set shiftwidth=2

set number
set mouse=a

set swapfile
set dir=~/.vimswap

set spell spelllang=en_us

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" set vim to chdir for each file
if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

helptags ~/.vim/bundle/ctrlp.vim/doc
