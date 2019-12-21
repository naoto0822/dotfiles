#!/bin/bash

source "$DOTPATH"/etc/util/logger.sh

# vim-plug
info_log "---> install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

