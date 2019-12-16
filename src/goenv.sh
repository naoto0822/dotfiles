#!/bin/sh

if [ ! -d $HOME/.goenv ]; then
  if [ `which brew` ]; then
    brew install goenv
  else
    git clone https://github.com/dataich/goenv.git $HOME/.goenv
  fi
fi
