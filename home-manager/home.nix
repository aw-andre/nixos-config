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
    ./nixvim.nix
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

  programs = {
    home-manager.enable = true;
    firefox.enable = true;
    vim.enable = true;
    git.enable = true;

    kitty = {
      enable = true;
      font.name = "JetBrains Mono";
      font.size = 17;
      themeFile = "VSCode_Dark";
      extraConfig = "cursor_trail 1";
    };
  };
}
