{ config, lib, pkgs, modulesPath, ... }:

{
  hardware.nvidia.prime = {
  	offload.enable = true;

  	intelBusId = "PCI:00:02:0";
  	
  	# Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
  	nvidiaBusId = "PCI:01:00:0";
  };
}
