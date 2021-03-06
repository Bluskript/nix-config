{
  description = "Blusk's Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager/master";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
  };


  outputs = { self, nixpkgs, unstable, nixos-hardware, home-manager, impermanence }: {
    nixosConfigurations.city17 = let system = "x86_64-linux"; in
      nixpkgs.lib.nixosSystem {
        inherit system;

        extraArgs = {
          unstablePkgs = import unstable { inherit system; };
          inherit impermanence;
        };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              unstablePkgs = import unstable { inherit system; };
              inherit impermanence;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.blusk = import ./home/default.nix;
          }
          impermanence.nixosModules.impermanence
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
