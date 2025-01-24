DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml .ssh_config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

## install dotfiles
install:
	DOTPATH=$(DOTPATH) bash $(DOTPATH)/install

## update dotfiles
update:
	DOTPATH=$(DOTPATH) bash $(DOTPATH)/update

## pull repo
pull:
	git pull origin master

## bootstrap
bootstrap:
	DOTPATH=$(DOTPATH) bash $(DOTPATH)/bin/util/osx_bootstrap.sh

## exec provision
pkg:
	$(foreach val, $(wildcard ./bin/*.sh), DOTPATH=$(DOTPATH) bash $(DOTPATH)/$(val);)

## deploy dotfiles
deploy:
	$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	cp -f .ssh_config $(HOME)/.ssh/config;
	cp -f .sheldon_plugins.toml $(HOME)/.config/sheldon/plugins.toml;

## dep resolved dependencies after install
dep:
	@echo "NOOP"

## install go dependencies
godep:
	# NOP

## rust dep
rustdep:
	rustup component add rls
	rustup component add rust-analysis
	rustup component add rust-src

## iterm2
iterm_shell_integration:
	curl -L https://iterm2.com/shell_integration/zsh \
		-o ~/.iterm2_shell_integration.zsh

## install npm dep
npmdep:
	npm install -g typescript-language-server

## show help
help:
	@make2help $(MAKEFILE_LIST)

## test
test:
	@echo $(DOTFILES)

.PHONY: install update pull pkg deploy dep godep help
