## referenced b4b4r07/dotfiles
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

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

init:
	@sh ./etc/install.sh

install: yeah update deploy init
	@echo "*****************************************"
	@echo "Installed Successfully My Dotfiles !!!"
	@echo "*****************************************"

test:
	## test
