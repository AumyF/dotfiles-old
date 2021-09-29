{ config, pkgs, libs, ... }: {
  programs.nushell = {
    enable = true;
    settings = {
      pivot_mode = "always";
      table_mode = "light";
      prompt = "starship prompt";
    };
  };
}
