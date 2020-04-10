#!/bin/bash

source "$DOTPATH"/etc/util/logger.sh

# command line tools
if [ ! `which xcode-select` ]; then
  xcode-select --install
  info_log "---> not install Command Line Tools !"
else
  info_log "---> already installed Command Line Tools"
fi

# for compinit
sudo chmod 755 /usr/local/share/zsh/site-functions
sudo chmod 755 /usr/local/share/zsh
