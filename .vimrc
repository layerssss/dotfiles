set nocompatible

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

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

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
" How can I open a NERDTree automatically when vim starts up if no files were
" specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
set rtp+=~/.vim/bundle/vim-rubocop
noremap <Leader>r :RuboCop<CR>
