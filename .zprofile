if which rbenv > /dev/null; then
    eval "$(rbenv init - zsh)";
fi

eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
