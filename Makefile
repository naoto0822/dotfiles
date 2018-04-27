## referenced b4b4r07/dotfiles
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml .ssh_config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

## install
all: start dep update deploy init finish

## echo say_dotfiles
start:
	@sh $(DOTPATH)/src/say_dotfiles.sh

## echo say_yeah
finish:
	@sh $(DOTPATH)/src/say_yeah.sh

## install dependencies
dep:
	go get github.com/Songmu/make2help/cmd/make2help

## update repo and submodule
update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

## replace dotfiles
deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	cp -rf vendor/.oh-my-zsh $(HOME)/
	cp -f .ssh_config $(HOME)/.ssh/config

## exec provision shell
init:
	@sh $(DOTPATH)/bin/init

## sandbox...
test:
	## test
	echo $(DOTPATH)

## show help
help:
	@make2help $(MAKEFILE_LIST)

.PHONY: start finish dep update deploy init test help
