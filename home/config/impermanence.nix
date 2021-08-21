{ pkgs, impermanence, ... }:

{
  imports = [ "${impermanence}/home-manager.nix" ];

  home.persistence."/persistent/home/blusk" = {};
}
