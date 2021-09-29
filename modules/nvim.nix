{ config, libs, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      coc-nvim
    ];
    extraConfig = ''
      set encoding=utf-8
      set autoindent
      set smartindent
      set number
      set expandtab
      set tabstop=2
    '';
  };
  programs.vim = {
    enable = true;
    settings = {
      expandtab = true;
      history = 100;
      number = true;
      tabstop = 2;
    };
    extraConfig = ''
      set encoding=utf-8
      scriptencoding utf-8
      set autoindent
      set smartindent
      
      set cursorline
    '';
  };
}
