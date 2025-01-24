#!/bin/bash

source "$DOTPATH"/bin/util/logger.sh

if [ ! `which rustc` ]; then
  curl https://sh.rustup.rs -sSf | sh
  info_log "---> installed successfully Rust!"
else
  info_log "---> already installed Rust"
fi
