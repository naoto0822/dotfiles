#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/logger.sh

info_log "[INFO] exec linux.sh"

# for CentOS

# Vim
yum -y install make
yum -y install gcc
yum -y install mercurial
yum -y install ncurses-devel
yum -y install lua-devel
yum -y install ruby-devel
yum -y install perl-ExtUtils-Embed

wget ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2
tar xvf vim-8.0.tar.bz2
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

make
make install

# Zsh
yum -y install zsh
chsh -s /bin/zsh

