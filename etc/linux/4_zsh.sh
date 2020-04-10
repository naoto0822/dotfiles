#!/bin/bash

ZSHPATH="/bin/zsh"

if [ ! $SHELL = $ZSHPATH ]; then
  chsh -s /bin/zsh
fi

if [ ! -e $HOME/.zinit ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi
