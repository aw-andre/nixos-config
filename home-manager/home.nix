{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./kitty.nix
    ./hyprland.nix
    ./sioyek.nix
    ./waybar.nix
    ./qutebrowser.nix
    ./zsh
    ./nixvim
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "andreaw";
    homeDirectory = "/home/andreaw";
    stateVersion = "25.05";
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };

  programs = {
    home-manager.enable = true;
    wofi.enable = true;
    git.enable = true;
  };
}
