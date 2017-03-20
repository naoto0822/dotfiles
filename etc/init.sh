#!/bin/sh

echo "-----------------------------------------"
echo "---> start install"
echo "-----------------------------------------"

# now mac OS
echo "[INFO] For macOS script"

# homebrew
if [ ! `which brew` ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
  echo "[INFO] installed successfully homebrew !"
else
  echo "[INFO] already installed homebrew"
fi

# oh-my-zsh!
# do nothing...

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
