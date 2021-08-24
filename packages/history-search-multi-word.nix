{ pkgs, src }:
pkgs.stdenv.mkDerivation {
  name = "history-search-multi-word";
  src = src;
}
