{ pkgs, src }: pkgs.vimUtils.buildVimPlugin {
  name = "nim-nvim";
  inherit src;
}
