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

join() {
  local IFS=$1
  shift
  echo "$*"
}

tworkspaces_start() {
  for workspace_link in $HOME/.tworkspaces/*
  do
    workspace_path=$(readlink $workspace_link)
    workspace_name=${workspace_link##*/}
    if [ -d $workspace_path ]
    then
      if tmux has-session -t "${workspace_name}" &> /dev/null
      then
      else
        (
          cd "${workspace_path}"
          tmux new-session -d -n "${workspace_name}" -s "${workspace_name}"
        )
      fi
    fi
  done
}

tworkspaces_link() {
  workspace_path=$1
  workspace_name=${2:-"${workspace_path##*/}"}
  if [ -z "${workspace_path}" ]
  then
    echo "Usage tworkspaces_link PATH [NAME]"
  else
    ln -sf "${workspace_path}" "$HOME/.tworkspaces/${workspace_name}"
    echo "linked: ${workspace_name}(${workspace_path})"
  fi
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
plugins=(git rails rake bundler)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

# git aliases
alias gprune="git remote prune origin && git branch -r | awk '{print \$1}' | egrep -v -f /dev/fd/0 <(git branch -vv) | awk '{print \$1}' | xargs git branch -d"
alias gbdeleteall="echo Deleting all branches, press Enter to continue. && read && git branch | xargs git branch -D"

autoload -U add-zsh-hook

export PATH="$(join ':' ~/.bins/* $PATH)"
export PATH="~/.bin:$PATH"
export PATH="bin:$PATH"

export BUNDLE_JOBS=$(getconf _NPROCESSORS_ONLN)

if [ -f ~/.env ]
then
  . ~/.env
fi
