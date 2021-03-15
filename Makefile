CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .github .config
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTCONFIG := $(wildcard .config/*)
UNAME_S := $(shell uname -s)

deploy:
	@$(foreach val, $(DOTFILES) $(DOTCONFIG), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

deploy_nix:
	@ln -sfnv $(abspath ".config/nixpkgs/home.base.nix") $(HOME)/.config/nixpkgs/home.base.nix


list_nix:
	@echo $(abspath ".config/nixpkgs/home.base.nix") $(HOME)/.config/nixpkgs/home.base.nix

list:
	@$(foreach val, $(DOTFILES) $(DOTCONFIG), /bin/ls -dF $(val);)

init:
ifeq ($(UNAME_S),Linux)
	@$(foreach val, etc/install/*.linux.sh, sh $(val))
else
	@$(info $(UNAME_S))
endif

init_list:
ifeq ($(UNAME_S), Linux)
	@$(foreach val, etc/install/*.linux.sh, echo $(val))
endif
