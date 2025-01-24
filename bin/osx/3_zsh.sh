#!/bin/bash

source "$DOTPATH"/bin/util/logger.sh

ZSHPATH="/opt/homebrew/bin/zsh"
if ! grep $ZSHPATH /etc/shells; then
  info_log "---> change default shell to zsh!"
  sudo sh -c "echo /opt/homebrew/bin/zsh >> /etc/shells"
  chsh -s /opt/homebrew/bin/zsh
else
  info_log "---> already default shell is zsh!"
fi

if [ ! -e $HOME/.zinit ]; then
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi
