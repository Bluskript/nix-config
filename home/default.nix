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
  xsession.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    defaultCursor = "left_ptr";
  };
}
