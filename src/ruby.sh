#!/bin/sh

if [ ! -d $HOME/.rbenv ]; then
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  gem install bundler
  gem install bundle
fi
