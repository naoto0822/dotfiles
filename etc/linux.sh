#!/bin/sh

CURRENT_PATH=$(cd $(dirname $0) && pwd)

. "$CURRENT_PATH"/logger.sh

# for Linux
info_log "exec linux.sh"

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
sudo yum -y install openssl-devel
sudo yum -y install readline-devel
sudo yum -y install zlib-devel
sudo yum -y install tmux

cd /usr/local/src/
sudo wget "http://www.lua.org/ftp/lua-5.3.4.tar.gz"
sudo tar xf lua-5.3.4.tar.gz
cd lua-5.3.4
sudo make linux
sudo make install
cd src
sudo mkdir include
sudo ln -s *.h ./include

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# vim with lua
# build and make.
cd /usr/local/src/
sudo git clone https://github.com/vim/vim.git
cd vim/
git pull
sudo make distclean

sudo ./configure \
  --prefix=/usr/local \
  --with-features=huge \
  --enable-multibyte \
  --enable-cscope \
  --enable-perlinterp \
  --enable-pythoninterp=dynamic \
  --with-python-config-dir=/usr/lib64/python2.6/config \
  --enable-rubyinterp=dynamic \
  --with-ruby-command=~/.rbenv/shims/ruby \
  --enable-luainterp=yes \
  --with-lua-prefix=/usr/local \
  --enable-fail-if-missing \

sudo make
sudo make install

cd $HOME/dotfiles

# Zsh
sudo chsh -s /bin/zsh

# tig
git clone git@github.com:jonas/tig.git $HOME/dotfiles/vendor/tig
cd $HOME/dotfiles/vendor/tig
make install install-release-doc prefix=$HOME/dotfiles/bin/tig
cd $HOME/dotfiles
