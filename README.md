# dotfiles
Michael Yin's dotfiles

# prepare for OSX

```
# set up Dropbox and install Homebrew
brew install zsh tmux vim git nvm rbenv ruby-build
```

# prepare for Ubuntu / Debian

```
sudo apt-get install rbenv zsh tmux vim-nox git build-essential \
  && if [ ! -d "$(rbenv root)/plugins/ruby-build" ]; then; git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build; fi \
  && wget -O - "https://www.dropbox.com/download?dl=packages/dropbox.py" | sudo dd of=/usr/local/bin/dropbox.py && sudo chmod +x /usr/local/bin/dropbox.py \
  && echo y | dropbox.py start --install && dropbox.py stop && (OUT="$(tempfile)" && nohup ~/.dropbox-dist/dropboxd > $OUT & tail -f $OUT &) \
  && curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
```

# bootstrap

```
curl -L https://github.com/layerssss/dotfiles/raw/master/bootstrap | zsh \
  && rbenv install 2.5.3 && rbenv global 2.5.3 \
  && nvm install 10 && nvm alias default 10
```
