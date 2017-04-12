#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/logger.sh

info_log "[INFO] exec common.sh"

# Ruby Bundler
gem install bundler

# oh-my-zsh!
# do nothing...

# vim-plug
info_log "[INFO] install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

