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
  	];
    allowOther = true;
  };

  programs.git = {
    userEmail = "bluskript@gmail.com";
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
