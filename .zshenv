# dotfiles
export DOTPATH=~/Documents/workspace/dotfiles

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
# NOTE: for local mac
export GOPATH=$HOME/Documents/workspace/go
export PATH=$PATH:$GOPATH/bin

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# ssh
export PATH="/usr/local/opt/openssl/bin:$PATH"
