#!/bin/bash

ZSHPATH="/bin/zsh"

if [ ! $SHELL = $ZSHPATH ]; then
  chsh -s /bin/zsh
fi

if [ ! -e $HOME/.zplugin ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi
