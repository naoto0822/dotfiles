#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/os.sh

echo "-----------------------------------------"
echo "---> start install"
echo "-----------------------------------------"

if [ $(is_macos) == "true" ]; then
  echo "[INFO] For macOS script"

  # Command Line Tools
  if [ ! `which xcode-select` ]; then
    xcode-select --install
    echo "[INFO] installed successfully Command Line Tools !"
  else
    echo "[INFO] already installed Command Line Tools"
  fi

  # homebrew
  if [ ! `which brew` ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    echo "[INFO] installed successfully homebrew !"
  else
    echo "[INFO] already installed homebrew"
  fi

fi

echo "[INFO] For common script"

# oh-my-zsh!
# do nothing...

# vim-plug
echo "[INFO] install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "******************************************"
echo "Installed Successfully My Dotfiles :tada: "
echo "******************************************"
