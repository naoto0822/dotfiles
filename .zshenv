# dotfiles
export DOTPATH=~/Documents/workspace/src/github.com/naoto0822/dotfiles

# base
export PATH=$PATH:$HOME/bin:/sbin:/usr/sbin

# HomeBrew
#export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/sbin:$PATH
#export PATH=/opt/homebrew/bin:$PATH
#export PATH=/opt/homebrew/sbin:$PATH
#export HOMEBREW_NO_ANALYTICS=1

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# go
export GOPATH=$HOME/Documents/workspace
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# ssh
export PATH="/usr/local/opt/openssl/bin:$PATH"

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# HomeBrew
eval "$(/opt/homebrew/bin/brew shellenv)"

export GOPROXY="https://proxy.golang.org,direct"

eval "$(direnv hook zsh)"
