# dotfiles

## Features

- Using [Nix Package Manager](https://nixos.org), a purely functional package manager
- Almost everything is managed by Nix and [nix-community/home-manager](https://github.com/nix-community/home-manager)
- Using [Nix Flakes](nixflakes), a new feature available in unstable builds of Nix (`nixpkgs.nixUnstable`)
- The login shell is zsh
  - [Starship](https://starship.rs)

## Setup

### WSL

1. Install an unstable version of Nix and home-manager
2. Clone this repository
3. In the directory, run `home-manager switch --flake .#wsl`

### macOS

Todo (It seems hard to use Nix on macOS; try later)

