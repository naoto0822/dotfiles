#!/bin/bash

cd /usr/local/src/
sudo git clone https://github.com/vim/vim.git
cd vim/
git pull
sudo make distclean

WHICH_RUBY=$(which ruby)

sudo ./configure \
  --prefix=/usr \
  --with-features=huge \
  --enable-multibyte \
  --enable-cscope \
  --enable-perlinterp \
  --enable-rubyinterp \
  --with-ruby-command=$WHICH_RUBY \
  --enable-luainterp \

sudo make
sudo make install
hash -r

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
