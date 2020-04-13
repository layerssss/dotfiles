# dotfiles
Michael Yin's dotfiles

# prepare for OSX

```
# set up ownCloud and install Homebrew
brew install zsh tmux vim git nvm rbenv ruby-build
```

# prepare for Ubuntu / Debian

```
mkdir -p ~/ownCloud
touch ~/.owncloud.exclude
```

```
sudo apt-get install rbenv zsh tmux vim-nox git build-essential owncloud-client-cmd \
  && if [ ! -d "$(rbenv root)/plugins/ruby-build" ]; then; git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build; fi \
  && curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
  && owncloudcmd --exclude ~/.owncloud.exclude --user layerssss ~/ownCloud https://owncloud.micy.in/
```

# bootstrap

```
curl -L https://github.com/layerssss/dotfiles/raw/master/bootstrap | zsh \
  && rbenv install 2.6.5 \
  && nvm install 12 && nvm alias default 12
```
