#!/bin/sh

. "$CURRENT_PATH"/logger.sh

info_log "[INFO] exec mac.sh"

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
