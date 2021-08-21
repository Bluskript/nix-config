{ config, lib, pkgs, modulesPath, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xterm.enable = true;
    # desktopManager.plasma5.enable = true;
    libinput.enable = true;
  };
}
