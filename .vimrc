set nocompatible
set backupcopy=yes

filetype plugin on

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let mapleader= ","

set backspace=indent,eol,start

set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set scrolloff=20

set number
set mouse=a
set showcmd

set showmatch

autocmd BufWritePre *.pl %s/\s\+$//e

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.axlsx set filetype=ruby
autocmd BufNewFile,BufRead *.iced set filetype=coffee
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .prettierrc set filetype=json
autocmd BufNewFile,BufRead *.gql set filetype=graphql
autocmd BufNewFile,BufRead *.prisma set filetype=graphql
autocmd BufNewFile,BufRead *.graphql set filetype=graphql
autocmd BufNewFile,BufRead *.hbs set filetype=handlebars

autocmd Syntax javascript,jsx,ruby,html setlocal foldmethod=syntax
autocmd Syntax javascript,jsx,ruby,html normal zR
