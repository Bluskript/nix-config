{ pkgs, impermanence, ... }:

{
  imports = [
    "${impermanence}/home-manager.nix"
    ./vscode.nix
    ./shell.nix
    ./bspwm.nix
    ./sxhkd.nix
    ./dunst.nix
    ./rofi.nix
  ];

  home.persistence."/nix/persist/home/blusk" = {
  	directories = [
  	  ".gnupg"
  	  ".ssh"
  	  ".local/share/keyrings"
  	  ".config/BraveSoftware"
  	  ".config/Code"
  	  ".config/discord"
  	];
    allowOther = true;
  };

  programs.git = {
    enable = true;
    userEmail = "bluskript@gmail.com";
    userName = "Danil Korennykh";
    signing.key = null;
    signing.signByDefault = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      import = [ "~/.cache/wal/colors-alacritty.yml" ];
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
