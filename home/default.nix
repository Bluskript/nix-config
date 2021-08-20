{ pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./bspwm.nix
    ./rofi.nix
  ];

  xsession.enable = true;
}
