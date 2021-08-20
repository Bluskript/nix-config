{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos/nixos-21.05";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/release-21.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  description = "A very basic flake";

  outputs = { self, nixpkgs, unstable, nixos-hardware, home-manager }: {
    nixosConfigurations.city17 = nixpkgs.lib.nixosSystem {
  	  # nix.registry.nixpkgs.flake = nixpkgs;
      system = "x86_64-linux";
  	  modules = [
  	    ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.blusk = import ./home.nix;
        }
  	  ] ++ (with nixos-hardware.nixosModules; [
  	    common-pc
  	    common-pc-laptop
  	    common-pc-laptop-acpi_call
  	    common-cpu-intel
  	    common-pc-ssd
  	    common-gpu-nvidia
      ]);
  	};
  };
}
