#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/logger.sh

info_log "---> exec mac_os.sh"

# ruby
sh "$CURRENT_PATH"/ruby.sh

# Command Line Tools
if [ ! `which xcode-select` ]; then
  xcode-select --install
  info_log "---> installed successfully Command Line Tools !"
else
  info_log "---> already installed Command Line Tools"
fi

# homebrew
if [ ! `which brew` ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  info_log "---> installed successfully homebrew !"
else
  info_log "---> already installed homebrew"
fi

# local Circle CI
# sh "$CURRENT_PATH"/local_ci.sh

