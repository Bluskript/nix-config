{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  description = "A very basic flake";

  outputs = { self, nixpkgs, nixos-hardware }: {
    nixosConfigurations.city17 = nixpkgs.lib.nixosSystem {
  	  # nix.registry.nixpkgs.flake = nixpkgs;
      system = "x86_64-linux";
  	  modules = [ (import ./configuration.nix) ];
  	};
  };
}
