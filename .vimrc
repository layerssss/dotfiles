set nocompatible

noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let mapleader= ","
syntax on

filetype plugin indent on

set expandtab
set tabstop=2
set shiftwidth=2

set number
set mouse=a
set showcmd

set swapfile
set dir=~/.vimswap

set spell spelllang=en_us
set nospell

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

set rtp+=~/.vim/bundle/command-t
