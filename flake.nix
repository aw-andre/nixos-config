{
  description = "NixOS Flake for T2 Mac";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixvim, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.andreaw = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.andreaw = {
              imports = [ ./home.nix ];
            };
          }
          nixos-hardware.nixosModules.apple-t2
        ];
      };
      hmConfig = {
        andreaw = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "andreaw";
          homeDirectory = "/home/andreaw";
          configuration = {
            imports = [
              ./home.nix
            ];
          };
        };
      };
    };
}
