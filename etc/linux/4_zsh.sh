#!/bin/bash

ZSHPATH="/bin/zsh"

if [ ! $SHELL = $ZSHPATH ]; then
  chsh -s /bin/zsh
fi

if [ ! -e $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
