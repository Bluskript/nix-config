{ hmUsers, pkgs, lib, ... }:
{
  # home-manager.users = { inherit (hmUsers) blusk; };

  environment.systemPackages = with pkgs; [
    # superuser prompt
    polkit
    # gnome frontend for polkit
    polkit_gnome
  ];

  programs.light.enable = true;

  security.sudo.wheelNeedsPassword = false;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.printing.enable = true;

  fonts = {
    enableDefaultFonts = false;
    fonts = with pkgs; [
      twitter-color-emoji
      fira-code
      noto-fonts-cjk
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        emoji = [
          "Twitter Color Emoji"
        ];
      };
    };
  };

  users.users.blusk = {
    isNormalUser = true;
    createHome = true;
    home = "/home/blusk";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel" # sudo perms
      "adbusers" # ADB perms
      "dialout" # useful for hardware dev
      "video" # adjust brightness
      "networkmanager" # able to manage internet
    ];
    hashedPassword = "$6$4YjCuLCPff$LwBCBi.eZSEQHQxWG1DLDqhF6.C.vB47fXAJD0qM.fdNz7H1yyVE60cGPejmQkLgsM1.B5tB.JAEXaiWO/b6z0";
  };

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = true;
    displayManager.lightdm.enable = true;
  };

  systemd = {
    targets.network-online.enable = false; # dont wait to connect to wifi, nice boot times
    services.systemd-networkd-wait-online.enable = false; # trollcrazy
    #    NetworkManager-wait-online.enable = false;
  };

  # required to make persistence.allowOther to work
  programs.fuse.userAllowOther = true;

  # required to make zsh completion work for system pkgs
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.blusk = import ./home.nix;
}
