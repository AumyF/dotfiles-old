{ config, pkgs, libs, ... }: {
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
        list = "lsd -F -l --blocks permission,user,group,size,date,name --date \"+%F %T UTC%z\"";
        apt-bump = "sudo apt-get update && sudo apt-get upgrade -y";
      };
    envExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        source $HOME/.nix-profile/etc/profile.d/nix.sh
        export fpath=(
          $HOME/.nix-profile/share/zsh/vendor-completions
          $HOME/.nix-profile/share/zsh/site-functions
          $fpath
        )
      fi

      # Gitコミット署名のため
      export GPG_TTY=$(tty)

      # skim統合
      source ${pkgs.skim}/share/skim/key-bindings.zsh
    '';
    initExtra = ''
      lsd -F -l --blocks permission,user,group,size,date,name --date "+%F %T UTC%z"
      chpwd() { lsd -F -l --blocks permission,user,group,size,date,name --date "+%F %T UTC%z" }
    '';
    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting.src;
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
