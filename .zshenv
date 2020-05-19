# dotfiles
export DOTPATH=~/Documents/workspace/src/github.com/naoto0822/dotfiles

# base
export PATH=$PATH:$HOME/bin:/sbin:/usr/sbin

# HomeBrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export HOMEBREW_NO_ANALYTICS=1

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1

# go
export GOPATH=$HOME/Documents/workspace
export PATH=$PATH:$GOPATH/bin

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# ssh
export PATH="/usr/local/opt/openssl/bin:$PATH"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Adding work
# export GOPRIVATE=github.com/hoge

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
