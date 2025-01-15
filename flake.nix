{
  description = "NixOS Flake for T2 Mac";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  }:
  let
    inherit (self) outputs;
  in {
    nixosConfigurations.andreaw = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        ./nixos/configuration.nix

        home-manager.nixosModules.home-manager {
          # home-manager.useGlobalPkgs = true;
	  home-manager = {
            useUserPackages = true;
            extraSpecialArgs = {
	      inherit inputs;
	    };

            users.andreaw = {
              imports = [
	        ./home-manager/home.nix
	      ];
            };
	  };
        }
      ];
    };
  };
}
