{ config, pkgs, ... }:

{
  home.username = "andreaw";
  home.homeDirectory = "/home/andreaw";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    firefox
  ];
}
