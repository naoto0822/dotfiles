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
sudo yum -y install lua
sudo yum -y install lua-devel
sudo yum -y install luajit
sudo yum -y install luajit-devel
sudo yum -y install ruby-devel
sudo yum -y install perl
sudo yum -y install perl-devel
sudo yum -y install perl-ExtUtils-ParseXS
sudo yum -y install perl-ExtUtils-XSpp
sudo yum -y install perl-ExtUtils-CBuilder
sudo yum -y install perl-ExtUtils-Embed
sudo yum -y install tcl-devel
sudo yum -y install ctags
sudo yum -y install zsh
sudo yum -y install openssl-devel
sudo yum -y install readline-devel
sudo yum -y install zlib-devel
sudo yum -y install tmux

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

cd $HOME/dotfiles

# Zsh
sudo chsh -s /bin/zsh

# tig
git clone git@github.com:jonas/tig.git $HOME/dotfiles/vendor/tig
cd $HOME/dotfiles/vendor/tig
make install install-release-doc prefix=$HOME/dotfiles/bin/tig
cd $HOME/dotfiles
