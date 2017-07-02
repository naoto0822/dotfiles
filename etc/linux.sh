#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/logger.sh

# for Linux
info_log "[INFO] exec linux.sh"

# install package
sudo yum -y install wget
sudo yum -y install make
sudo yum -y install gcc
sudo yum -y install mercurial
sudo yum -y install ncurses-devel
sudo yum -y install lua-devel
sudo yum -y install ruby-devel
sudo yum -y install perl-ExtUtils-Embed
sudo yum -y install python-devel
sudo yum -y install zsh

# vim with lua
# build and make.
cd /usr/local/src/
sudo wget ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2
sudo tar xvf vim-8.0.tar.bz2
cd vim80

./configure \
  --enable-multibyte \
  --with-features=huge \
  --enable-luainterp \
  --enable-perlinterp \
  --enable-pythoninterp \
  --with-python-config-dir=/usr/lib64/python2.6/config \
  --enable-rubyinterp \
  --with-ruby-command=/usr/bin/ruby \

sudo make
sudo make install

cd $HOME/dotfiles

# Zsh
chsh -s /bin/zsh

