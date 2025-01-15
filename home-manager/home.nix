{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
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
    nixvim = {
      enable = true;
      vimAlias = true;
    };
  };
}
