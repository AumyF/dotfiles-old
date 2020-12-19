CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .github
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
UNAME_S := $(shell uname -s)

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

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
