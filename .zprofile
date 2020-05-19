if which rbenv > /dev/null; then
    eval "$(rbenv init - zsh)";
fi

eval "$(goenv init -)"

eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

source "$HOME/.sdkman/bin/sdkman-init.sh"
