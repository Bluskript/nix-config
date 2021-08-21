{ pkgs, impermanence, ... }:

{
  imports = [
    "${impermanence}/home-manager.nix"
    ./config
  ];

  home.file = {
    "scripts" = {
      source = ./scripts;
      executable = true;
    };
    "wallpapers" = {
      source = ./wallpapers;
    };
  };

  xsession.enable = true;
}
