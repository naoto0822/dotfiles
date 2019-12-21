if which rbenv > /dev/null; then
    eval "$(rbenv init - zsh)";
fi

eval "$(goenv init -)"

eval "$(pyenv init -)"
