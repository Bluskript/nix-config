{ config, lib, pkgs, modulesPath, ... }:

{
  # tro
  nixpkgs.config.allowUnfree = true;


  nix = {
    # enables Nix flakes
    package = pkgs.nixFlakes;
    extraOptions = ''
	    extra-experimental-features = flakes nix-command ca-references
    '';

    autoOptimiseStore = true;
    gc.automatic = true;
    optimise.automatic = true;
  };
}
