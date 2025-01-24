#!/bin/bash

source "$DOTPATH"/bin/util/logger.sh

if [ ! `which xcode-select` ]; then
  xcode-select --install
  info_log "---> installed successfully Command Line Tools !"
else
  info_log "---> already installed Command Line Tools"
fi

if [ ! `which brew` ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  info_log "---> installed successfully homebrew !"
else
  info_log "---> already installed homebrew"
fi

info_log "---> install brew pkg"
#brew tap Homebrew/bundle
#brew bundle --verbose --file="$DOTPATH/Brewfile"
