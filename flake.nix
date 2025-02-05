{
  description = "NixOS Flake for T2 Mac";

  inputs = {

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixos-hardware,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations.andreaw = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./nixos/configuration.nix
          nixos-hardware.nixosModules.apple-t2
          nixos-hardware.nixosModules.common-cpu-intel
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-pc-laptop
          nixos-hardware.nixosModules.common-pc-laptop-ssd

          home-manager.nixosModules.home-manager
          {
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
