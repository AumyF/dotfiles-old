link_nix:
	@ln -sfnv $(abspath ".config/nixpkgs/home.base.nix") $(HOME)/.config/nixpkgs/home.base.nix
	@ln -sfnv $(abspath ".config/nix/nix.conf") $(HOME)/.config/nix/nix.conf

dry_link_nix:
	@echo $(abspath ".config/nixpkgs/home.base.nix") $(HOME)/.config/nixpkgs/home.base.nix

init_ubuntu:
	sudo sed -i.bak -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get install zsh
	chsh -s $(which zsh)
