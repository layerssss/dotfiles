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
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt correct

export NAME="Michael Yin"
export EMAIL="layerssss@gmail.com"

# Customize to your needs...

# kdiff3
export PATH=/Applications/kdiff3.app/Contents/MacOS:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="bin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:$PATH"

alias sprake="spring rake"
alias sprails="spring rails"
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

command_exists () {
    type "$1" &> /dev/null ;
}

export NVM_DIR=~/.nvm

if command_exists brew
then
	. $(brew --prefix nvm)/nvm.sh
fi

if [ -f ~/.nvm/nvm.sh ]
then
  . ~/.nvm/nvm.sh
fi

if [ -f ~/.env ]
then
  . ~/.env
fi
