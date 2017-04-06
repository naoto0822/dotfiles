#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/os.sh
. "$CURRENT_PATH"/logger.sh

info_log "-----------------------------------------"
info_log "---> start install"
info_log "-----------------------------------------"

if [ $(is_macos) == "true" ]; then
  info_log "[INFO] For macOS script"

  # Command Line Tools
  if [ ! `which xcode-select` ]; then
    xcode-select --install
    info_log "[INFO] installed successfully Command Line Tools !"
  else
    info_log "[INFO] already installed Command Line Tools"
  fi

  # homebrew
  if [ ! `which brew` ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    info_log "[INFO] installed successfully homebrew !"
  else
    info_log "[INFO] already installed homebrew"
  fi

fi

info_log "[INFO] For common script"

# oh-my-zsh!
# do nothing...

# vim-plug
info_log "[INFO] install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

info_log "******************************************"
info_log "Installed Successfully My Dotfiles :tada: "
info_log "******************************************"
