{ config, libs, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ nim-nvim coc-nvim ];
    viAlias = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./nvim.vim;
    coc = {
      enable = true;
      settings = builtins.readFile ./nvim-coc.json;
    };
  };
}
