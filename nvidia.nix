{ config, lib, pkgs, modulesPath, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
}
