{
  description = "NixOS Flake for T2 Mac";

  nixConfig = {
    extra-substituters = [
      "https://cache.soopy.moe"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.soopy.moe-1:0RZVsQeR+GOh0VQI9rvnHz55nVXkFardDqfm4+afjPo="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  inputs = {

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixos-hardware,
      nixvim,
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
                  nixvim.homeManagerModules.nixvim
                  ./home-manager/home.nix
                ];
              };
            };
          }
        ];
      };
    };
}
