DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml .ssh_config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

export GO111MODULE:=on

## install dotfiles
install:
	DOTPATH=$(DOTPATH) bash $(DOTPATH)/install

## update dotfiles
update:
	DOTPATH=$(DOTPATH) bash $(DOTPATH)/update

## pull repo and submodule
pull:
	git pull origin master
	# git submodule init
	# git submodule update
	# git submodule foreach git pull origin master

## bootstrap
bootstrap:
	DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/util/osx_bootstrap.sh

## exec provision
pkg:
	$(foreach val, $(wildcard ./etc/*.sh), DOTPATH=$(DOTPATH) bash $(DOTPATH)/$(val);)

## deploy dotfiles
deploy:
	$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	cp -f .ssh_config $(HOME)/.ssh/config;

## dep resolved dependencies after install
dep:
	@echo "NOOP"

## install go dependencies
godep:
	GO111MODULE=on go get golang.org/x/tools/gopls@latest
	go get github.com/Songmu/make2help/cmd/make2help

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
