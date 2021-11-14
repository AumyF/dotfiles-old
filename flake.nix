{
  description = "home configuration of Aumy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, home-manager, nixpkgs, flake-utils, ... }:
    let
      overlays = [
        (
          self: super: { }
        )
      ];
    in
    {
      homeConfigurations =
        let
          wsl = username: home-manager.lib.homeManagerConfiguration {
            configuration = { pkgs, config, ... }: {
              nixpkgs = {
                overlays = overlays;
              };
              imports = [
                ./modules/cli.nix
                ./modules/shells.nix
              ];
              home.packages = with pkgs;[
                cachix
                gh
                ghq
                gnupg
                keybase
                niv
                nixpkgs-fmt
                nix-prefetch-github
                nodejs-16_x
                rnix-lsp
                yarn
              ];
              programs.home-manager.enable = true;
              programs.git = {
                enable = true;
                userName = "Aumy";
                userEmail = "aumy@outlook.jp";
                signing = {
                  key = "5911EC1BAD704C03";
                  signByDefault = false;
                };
              };

            };
            system = "x86_64-linux";
            username = username;
            homeDirectory = "/home/${username}";
          };
        in
        {
          wsl-shiyuki = wsl "user";
          wsl-chiaki = wsl "u";
        };
      wsl-shiyuki = self.homeConfigurations.wsl-shiyuki.activationPackage;
      wsl-chiaki = self.homeConfigurations.wsl-chiaki.activationPackage;
    };
}
