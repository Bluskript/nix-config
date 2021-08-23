{ config, pkgs, suites, ... }:

{
  imports = suites.base ++ [
    ./sxhkd.nix
  ];

  home = {
    persistence."/nix/persist/home/blusk" = {
      directories = [
        ".gnupg"
        ".ssh"
        ".vscode"
        ".local/share/keyrings"
        ".config/BraveSoftware"
        ".config/Code"
        ".config/discord"
        ".local/share/zsh/history"
      ];
      allowOther = true;
    };

    file = {
      "scripts" = {
        source = ./scripts;
        executable = true;
      };
      "wallpapers" = {
        source = ./wallpapers;
      };
    };
    packages = with pkgs; [
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
      # bloatware
      neofetch
      # better nano
      micro
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
    ];
  };

  services = {
    dunst.enable = true;
    gpg-agent = {
      enable = true;
      grabKeyboardAndMouse = false;
      pinentryFlavor = "qt";
    };
  };

  xdg.configFile = {
    "dunst/dunstrc".source = ./dunstrc;
  };

  programs = {
    feh.enable = true;
    rofi.enable = true;
    alacritty = {
      enable = true;
    };
    zsh = {
      enable = true;
      autocd = true;
      enableVteIntegration = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      # xdg compliant
      dotDir = ".config/zsh";
      history.path = ".local/share/zsh/history";
    };
    git = {
      enable = true;
      userEmail = "bluskript@gmail.com";
      userName = "Danil Korennykh";
      signing.key = null;
      signing.signByDefault = true;
    };
    vscode = {
      enable = true;
    };
    exa = {
      enable = true;
      enableAliases = true;
    };
  };

  xsession = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
      monitors = {
        eDP-1 = [ "I" "II" "III" "IV" "V" ];
        HDMI-0 = [ "I" "II" "III" "IV" "V" ];
      };
      settings = {
        focus_follows_pointer = true;
        border-width = 2;
        window_gap = 12;
      };
      startupPrograms = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "${./scripts/wallpaper-changer.sh}"
      ];
    };
    # pointerCursor = {
    # name = "Quintom_Ink";
    # package = latest.quintom-cursor-theme;
    # defaultCursor = "left_ptr";
    # size = 16;
    # };
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
