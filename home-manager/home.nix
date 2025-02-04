{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./hyprland.nix
    ./sioyek.nix
    ./waybar.nix
    ./nixvim
  ];

  nixpkgs = {
    overlays = [];
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
    qutebrowser.enable = true;
    vim.enable = true;
    git.enable = true;

    kitty = {
      enable = true;
      font.name = "JetBrains Mono";
      font.size = 15;
      themeFile = "VSCode_Dark";
      extraConfig = ''
        modify_font cell_height 150%
        cursor_trail 1
        cursor_trail_decay 0.1 0.3
        cursor_trail_start_threshold 0
      '';
    };
  };
}
