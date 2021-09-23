set nocompatible
set backupcopy=yes
filetype off

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

autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead *.axlsx set filetype=ruby
autocmd BufNewFile,BufRead *.iced set filetype=coffee
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .prettierrc set filetype=json
autocmd BufNewFile,BufRead *.gql set filetype=graphql
autocmd BufNewFile,BufRead *.prisma set filetype=graphql
autocmd BufNewFile,BufRead *.graphql set filetype=graphql

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPMixed'
set rtp+=~/.vim/bundle/ctrlp.vim

set rtp+=~/.vim/bundle/typescript-vim
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
set rtp+=~/.vim/bundle/vimproc.vim
set rtp+=~/.vim/bundle/tsuquyomi

set rtp+=~/.vim/bundle/neoformat
noremap <Leader>f :Neoformat<CR>
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_json = ['prettier']

set rtp+=~/.vim/bundle/emmet-vim
let g:user_emmet_settings={
\  'javascript' : {
\    'extends': 'jsx',
\    'default_attributes': {
\      'label': [{'htmlFor': ''}],
\      'class': {'className': ''},
\    }
\  },
\}
autocmd FileType html,css,javascript,jsx EmmetInstall

set rtp+=~/.vim/bundle/vim-less
set rtp+=~/.vim/bundle/vim-css-color
set rtp+=~/.vim/bundle/vim-css3-syntax

set rtp+=~/.vim/bundle/nerdtree
map <C-n> :NERDTreeToggle<CR>

set rtp+=~/.vim/bundle/vim-rubocop
noremap <Leader>r :RuboCop<CR>

set rtp+=~/.vim/bundle/syntastic
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec      = '`which rubocop`'
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter', 'gofmt']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
set rtp+=~/.vim/bundle/vim-pug

set rtp+=~/.vim/bundle/editorconfig-vim

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

set rtp+=~/.vim/bundle/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

set rtp+=~/.vim/bundle/matchit
source ~/.vim/bundle/matchit/plugin/matchit.vim
set rtp+=~/.vim/bundle/readline
set rtp+=~/.vim/bundle/vim-rabl
set rtp+=~/.vim/bundle/Dockerfile

syntax on
filetype plugin indent on
