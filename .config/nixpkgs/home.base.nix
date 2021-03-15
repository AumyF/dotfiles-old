{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = with pkgs; [
    bat
    cachix
    deno
    dogdns
    dotnet-sdk_5
    du-dust
    fd
    gh
    ghc
    git
    go
    haskell-language-server
    hexyl
    jq
    niv
    nix-prefetch-github
    openjdk
    procs
    pueue
    ripgrep
    ruby
    sbt
    scala
    silicon
    skim
    vim
    zoxide
  ];

  programs.git = {
    enable = true;
    userName = "Aumy";
    userEmail = "46275902+AumyF@users.noreply.github.com";
  };
  programs.lsd = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    settings = {
      status = {
        disabled = false;

      };
      time = {
        disabled = false;
        utc_time_offset = "+9";
      };

    };
  };
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases =
      {
        list = "lsd -F -l --blocks permission,user,group,size,inode,date,name --date \"+%F %T UTC%z\"";
      };
    initExtra = ''
      if [ -e /home/u/.nix-profile/etc/profile.d/nix.sh ]; then . /home/u/.nix-profile/etc/profile.d/nix.sh; fi
      lsd -F -l --blocks permission,user,group,size,inode,date,name --date "+%F %T UTC%z"
      chpwd() { lsd -F -l --blocks permission,user,group,size,inode,date,name --date "+%F %T UTC%z" }
    '';
    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting.src;
      }
      {
        name = "history-search-multi-word";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma";
          repo = "history-search-multi-word";
          rev = "v1.2.52";
          sha256 = "1dqwkw3cwvmmmaczs7vrh3wgrxhc9s2vbyn56nk9rc3561s0s9w7";
        };
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions.src;
      }
      {
        name = "nix-zsh-completions";
        src = pkgs.nix-zsh-completions.src;
      }
    ];
  };
}
