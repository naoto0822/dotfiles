## referenced b4b4r07/dotfiles
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all:
	@make help

help:
	@echo "***************************************************"
	@echo "HELP"
	@echo "***************************************************"
	@echo "make yeah    : echo yeah"
	@echo "make update  : exec git pull and submodule update"
	@echo "make deploy  : cp dotfiles to home directory"
	@echo "make init    : exec init.sh"
	@echo "make install : dep yeah, updatem deploy, init"
	@echo "make test    : test command"
	@echo "***************************************************"

yeah:
	@echo ""
	@echo "-----------------------------------------"
	@echo " \    / / //   / /  // | |     //    / / "
	@echo "  \  / / //____    //__| |    //___ / /  "
	@echo "   \/ / / ____    / ___  |   / ___   /   "
	@echo "   / / //        //    | |  //    / /    "
	@echo "  / / //____/ / //     | | //    / /     "
	@echo "-----------------------------------------"
	@echo ""

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	cp -rf vendor/.oh-my-zsh $(HOME)/

init:
	@sh $(DOTPATH)/etc/init.sh

install: yeah update deploy init
	@echo "*****************************************"
	@echo "Finished make install command."
	@echo "*****************************************"

test:
	## test
	echo $(DOTPATH)
