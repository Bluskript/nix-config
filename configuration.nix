# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, config, nixos-hardware, unstablePkgs, ... }@args:

{
  imports =
    [

      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./boot.nix
      ./nvidia.nix
      ./user-hardware.nix
      ./nix-prefs.nix
      ./xorg.nix
    ];

  environment.persistence."/nix/persist" = {
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
      "/etc/nix/id_rsa"
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

  security.polkit.enable = true;

  networking.hostName = "city17"; # Define your hostname.
  networking.networkmanager.enable = true; # Enables wireless support via wpa_supplicant.
  # networking.wireless.interfaces = [ "wlp4s0" ];
  # networking.wireless.userControlled.enable = true;
  # networking.wireless.userControlled.group = "wheel";

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0f1.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;

  programs.fuse.userAllowOther = true;


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.hashedPassword = "$6$4YjCuLCPff$LwBCBi.eZSEQHQxWG1DLDqhF6.C.vB47fXAJD0qM.fdNz7H1yyVE60cGPejmQkLgsM1.B5tB.JAEXaiWO/b6z0";
  security.sudo.wheelNeedsPassword = false;
  users.users.blusk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "$6$4YjCuLCPff$LwBCBi.eZSEQHQxWG1DLDqhF6.C.vB47fXAJD0qM.fdNz7H1yyVE60cGPejmQkLgsM1.B5tB.JAEXaiWO/b6z0";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brave
    discord
    # file browser
    dolphin
    # this is used to make micro clipboard work
    xclip
    # efficient screenshotting
    shotgun
    # helper to find the selection
    hacksaw
    # gif recorder
    peek
    # partition viewer
    gparted
    # so we back in the mine...
    minecraft
    # auth for gpg
    pinentry
    # gnome gui for gpg auth
    pinentry_gnome
    # superuser prompt
    polkit
    # gnome frontend for polkit
    polkit_gnome
    # bloatware
    neofetch
    # fancy system monitor
    bottom-rs
    # fancier version of du
    du-dust
    # fancier version of find
    fd
    # better grep basically
    ripgrep
    # shows hardware, used to get NVIDIA bus IDs
    lshw
    # wallpaper changing tool with color support
    pywal
    # dracula themes everywhere
    dracula-theme
    # gtk theming needs this as a dependency. TODO: make a PR for this
    dconf
  ] ++ [
    unstablePkgs.micro
    # LSP for nix for better IDE integrations
    unstablePkgs.rnix-lsp
    unstablePkgs.nixpkgs-fmt
  ];

  fonts = {
    enableDefaultFonts = false;
    fonts = with pkgs; [
      twitter-color-emoji
      fira-code
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

