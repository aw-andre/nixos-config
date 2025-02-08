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
    ./hyprlock.nix
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
    packages = with pkgs; [
      hyprshot
    ];
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    swaync.enable = true;
  };

  programs = {
    home-manager.enable = true;
    wofi.enable = true;
    git.enable = true;
  };
}
