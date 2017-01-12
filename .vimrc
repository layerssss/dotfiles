set nocompatible
set backupcopy=yes

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let mapleader= ","
syntax on

filetype plugin indent on

set backspace=indent,eol,start

set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=20
set spell spelllang=en_nz
set nospell

set number
set mouse=a
set showcmd

set swapfile
set dir=~/.vimswap

set spell spelllang=en_us
set nospell

set showmatch

autocmd BufWritePre *.pl %s/\s\+$//e

autocmd BufNewFile,BufRead *.iced set filetype=coffee

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

set rtp+=~/.vim/bundle/command-t
set rtp+=~/.vim/bundle/RootIgnore
let g:CommandTTraverseSCM = 'pwd'
noremap <Leader>l :CommandTLine<CR>

set rtp+=~/.vim/bundle/typescript-vim
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
set rtp+=~/.vim/bundle/vimproc.vim
set rtp+=~/.vim/bundle/tsuquyomi
set rtp+=~/.vim/bundle/vim-autoformat

noremap <Leader>f :Autoformat<CR>

set rtp+=~/.vim/bundle/vim-js-pretty-template
set rtp+=~/.vim/bundle/emmet-vim

set rtp+=~/.vim/bundle/vim-less
set rtp+=~/.vim/bundle/vim-css-color
set rtp+=~/.vim/bundle/vim-css3-syntax

set rtp+=~/.vim/bundle/nerdtree
map <C-n> :NERDTreeToggle<CR>

set rtp+=~/.vim/bundle/vim-rubocop
noremap <Leader>r :RuboCop<CR>

set rtp+=~/.vim/bundle/syntastic
"Rubocop
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec      = '`which rubocop`'
"for haml
let g:syntastic_haml_checkers = ['haml_lint']

set rtp+=~/.vim/bundle/vim-sleuth

set rtp+=~/.vim/bundle/neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

set rtp+=~/.vim/bundle/vim-fugitive
set rtp+=~/.vim/bundle/vim-coffee-script
set rtp+=~/.vim/bundle/vim-es6
