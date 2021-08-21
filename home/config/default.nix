{ pkgs, ... }:

{
  imports = [
    ./impermanence.nix
    ./vscode.nix
    ./shell.nix
    ./bspwm.nix
    ./sxhkd.nix
    ./dunst.nix
    ./rofi.nix
  ];

  programs.git = {
    userEmail = "bluskript@gmail.com";
    signing.signByDefault = true;
  };
}
