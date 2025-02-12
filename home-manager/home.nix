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
    ./wofi.nix
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
      keyutils
      bitwarden-cli
      bitwarden-desktop
      hyprshot
      brightnessctl
      playerctl
      wireplumber
    ];
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    swaync.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${./wallpaper.jpg}" ];
        wallpaper = [ ",${./wallpaper.jpg}" ];
      };
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };
}
