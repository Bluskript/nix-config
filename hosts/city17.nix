{ suites, profiles, nixos-hardware, ... }:
{
  ### root password is empty by default ###
  imports = suites.base ++ [ profiles.users.blusk ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true; # i'm sorry but grub is just better
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.initrd.kernelModules = [ ];

  networking.networkmanager.enable = true;

  hardware.nvidia.prime = {
    offload.enable = true;

    intelBusId = "PCI:00:02:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:01:00:0";
  };

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

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=4G" "mode=755" ];
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
    "/nix" = {
      device = "/dev/disk/by-label/nix";
      fsType = "ext4";
      neededForBoot = true;
    };
    "/etc/nixos" = {
      device = "/nix/persist/etc/nixos";
      fsType = "none";
      options = [ "bind" ];
    };
    "/oldSystem" = {
      device = "/dev/disk/by-label/arch";
      fsType = "ext4";
    };
  };
}
