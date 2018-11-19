setopt null_glob
command_exists () {
  type "$1" &> /dev/null ;
}
nobodydo () {
  sudo -u nobody $@
}

retry () {
  while true
  do
    $@
    ret=$!
    if [ $ret -ne 0 ]
    then
      echo "\"$@\" faild (returned $ret)"
      sleep 3
    else
      echo "\"$@\" exited."
      sleep 0.5
    fi
  done
}

try_clone() {
  repo=$1
  target=$2
  head=${3:-master}

  if [ ! -d $target ]
  then
    echo Installing $repo...
    git clone --depth=1 $repo $target -b $head
    echo Done.
  fi
}

function join() {
  local IFS=$1
  shift
  echo "$*"
}

try_clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby bundler)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:$PATH"

alias npm="noglob npm"
alias bower="noglob bower"
alias gprune="git remote prune origin && git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv) | awk '{print \$1}' | xargs git branch -d"

export PATH=".rbenv/bin:$PATH"
export RBENV_ROOT=~/.rbenv

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias gprelease="git push -f origin HEAD:release"
alias gpfr="git fetch origin && git push -f origin origin/master:release"
alias gcap!="git commit --all --amend --reuse-message HEAD && git push -f"
alias gfhrm="git fetch origin && git reset --hard origin/master"
alias upplib="(bundle update plib --source plib > /dev/null && gca -m 'updated plib') || true"

export NVM_DIR=~/.nvm

if command_exists brew
then
  . $(brew --prefix nvm)/nvm.sh
fi

if [ -f ~/.nvm/nvm.sh ]
then
  . ~/.nvm/nvm.sh
fi

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
local node_version="$(nvm version)"
local nvmrc_path="$(nvm_find_nvmrc)"

if [ -n "$nvmrc_path" ]; then
  local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

  if [ "$nvmrc_node_version" = "N/A" ]; then
    nvm install
  elif [ "$nvmrc_node_version" != "$node_version" ]; then
    nvm use
  fi
elif [ "$node_version" != "$(nvm version default)" ]; then
  echo "Reverting to nvm default version"
  nvm use default
fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

if [ -f ~/.env ]
then
  . ~/.env
fi


mkdir -p ~/.vimswap

try_clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
try_clone https://github.com/octref/RootIgnore.git ~/.vim/bundle/RootIgnore
try_clone https://github.com/kchmck/vim-coffee-script.git ~/.vim/bundle/vim-coffee-script/
try_clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim
try_clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
vimproc_libs=`ls ~/.vim/bundle/vimproc.vim/lib | grep vimproc | grep .so`
if [ -z $vimproc_libs ]
then
  echo "
  cd ~/.vim/bundle/vimproc.vim
  make
  " | zsh
fi

if [ ! -d ~/.bin/node_modules/js-beautify ]
then
  echo "
  cd ~/.bin/node_modules
  tar -xzf js-beautify.tar.gz
  " | zsh
fi

try_clone https://github.com/Quramy/tsuquyomi.git ~/.vim/bundle/tsuquyomi
try_clone https://github.com/sbdchd/neoformat ~/.vim/bundle/neoformat
try_clone https://github.com/Quramy/vim-js-pretty-template ~/.vim/bundle/vim-js-pretty-template
try_clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle/emmet-vim
try_clone https://github.com/groenewege/vim-less.git ~/.vim/bundle/vim-less
try_clone https://github.com/skammer/vim-css-color.git ~/.vim/bundle/vim-css-color
try_clone https://github.com/hail2u/vim-css3-syntax.git ~/.vim/bundle/vim-css3-syntax
try_clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
try_clone https://github.com/ngmy/vim-rubocop.git ~/.vim/bundle/vim-rubocop
try_clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic 3.8.0
try_clone https://github.com/tpope/vim-sleuth.git ~/.vim/bundle/vim-sleuth
try_clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete
try_clone https://github.com/tpope/vim-fugitive ~/.vim/bundle/vim-fugitive
try_clone https://github.com/isRuslan/vim-es6.git ~/.vim/bundle/vim-es6
try_clone https://github.com/digitaltoad/vim-pug.git ~/.vim/bundle/vim-pug
try_clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter


export PLATFORM=$(uname -s)
export PLATFORM=$PLATFORM:l

export PATH=~/.local/bin:$PATH

find ~/Dropbox/credentials -type f -exec chmod 0600 {} \;
chmod 0755 ~/.bins/dropbox/* ~/.bins.${PLATFORM}/dropbox/*

export PATH=$(join ':' ~/.bins.${PLATFORM}/*):$(join ':' ~/.bins/*):$PATH
export PATH=~/.bin.${PLATFORM}:~/.bin:$PATH
export PATH="bin.${PLATFORM}:bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-$NAME}"
export GIT_COMMITTER_NAME="${GIT_COMMITTER_NAME:-$NAME}"
export GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-$EMAIL}"
export GIT_COMMITTER_EMAIL="${GIT_COMMITTER_EMAIL:-$EMAIL}"

export BUNDLE_JOBS=$(getconf _NPROCESSORS_ONLN)
