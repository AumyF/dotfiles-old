# dotfiles

## Features

- Using [Nix Package Manager](https://nixos.org), a purely functional package manager
- Almost everything is managed by Nix and [nix-community/home-manager](https://github.com/nix-community/home-manager)
- The login shell is zsh
  - [Starship](https://starship.rs)

## Setup

1. Install Nix and home-manager
  - `curl -L https://nixos.org/nix/install | sh`
  - ` nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager`
  - `nix-channel --update`
  - `nix-shell '<home-manager>' -A install`
2. `make link_nix`
  - Create symlink from ./.config/nixpkgs/home.base.nix to ~/.config/nixpkgs/home.base.nix

### macOS

Todo (It seems hard to use Nix on macOS; try later)

## Additional Scripts

Some useful configs

- `make init_ubuntu`
  - For Ubuntu (, Debian, Mint, or any Debian-based distributions)
  - Set apt-source to mirror servers
  - Install zsh and set it as login shell
