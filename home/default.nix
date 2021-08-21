{ pkgs, impermanence, ... }:

{
  imports = [
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
