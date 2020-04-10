#!/bin/bash

source "$DOTPATH"/etc/util/logger.sh

ZSHPATH="/usr/local/bin/zsh"
if ! grep $ZSHPATH /etc/shells; then
  info_log "---> change default shell to zsh!"
  sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
  chsh -s /usr/local/bin/zsh
else
  info_log "---> already default shell is zsh!"
fi

if [ ! -e $HOME/.zinit ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi
