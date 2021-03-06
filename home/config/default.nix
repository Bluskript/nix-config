{ pkgs, impermanence, ... }:

{
  imports = [
    "${impermanence}/home-manager.nix"
    ./vscode.nix
    ./shell.nix
    ./bspwm.nix
    ./sxhkd.nix
    ./rofi.nix
    ./polybar
  ];

  xdg.configFile = {
    "dunst/dunstrc".source = ./dunst/dunstrc;
  };

  services.dunst.enable = true;

  home.persistence."/nix/persist/home/blusk" = {
    directories = [
      ".gnupg"
      ".ssh"
      ".vscode"
      ".local/share/keyrings"
      ".config/BraveSoftware"
      ".config/Code"
      ".config/discord"
    ];
    allowOther = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
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

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
    };
  };
}
