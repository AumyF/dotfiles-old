{
  description = "home configuration of Aumy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
    history-search-multi-word = {
      type = "github";
      owner = "zdharma";
      repo = "history-search-multi-word";
      ref = "v1.2.52";
      flake = false;
    };
  };
  outputs = { self, home-manager, nixpkgs, flake-utils, history-search-multi-word, ... }: let
    overlays = [
      (
        self: super: {
          history-search-multi-word = super.callPackage ./packages/history-search-multi-word.nix {
            src = history-search-multi-word;
          };
        }
      )
    ];
  in
    {
      homeConfigurations = {
        wsl =
          home-manager.lib.homeManagerConfiguration {
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
                git
                niv
                nix-prefetch-github
                nodejs-16_x
                rnix-lsp
              ];
              programs.home-manager.enable = true;

            };
            system = "x86_64-linux";
            username = "user";
            homeDirectory = "/home/user";
          };
      };
      wsl = self.homeConfigurations.wsl.activationPackage;
    };
}
