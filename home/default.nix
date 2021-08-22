{ pkgs, impermanence, unstablePkgs, ... }:

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
    name = "Quintom_Ink";
    package = unstablePkgs.quintom-cursor-theme;
    defaultCursor = "left_ptr";
    size = 16;
  };
}
