{ config, pkgs, libs, ... }: {
  home.packages = with pkgs;[
    bat
    dogdns
    du-dust
    fd
    hexyl
    jq
    procs
    pueue
    ripgrep
    silicon
    skim
  ];
  programs.lsd = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
