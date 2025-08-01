{ config, inputs, pkgs, ... }: {
  imports = [
    ./nixvim
    ./ripgrep.nix
    ./direnv.nix
    ./git.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    ./qutebrowser.nix
    ./shell
    ./sioyek.nix
    ./waybar.nix
    ./wofi.nix
    ./fzf.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = { allowUnfree = true; };
  };

  home = {
    username = "andreaw";
    homeDirectory = "/home/andreaw";
    stateVersion = "25.05";
    packages = with pkgs; [
      bitwarden-cli
      bitwarden-desktop
      brightnessctl
      calibre
      discord
      hyprshot
      libmtp
      playerctl
      python314FreeThreading
      ripgrep-all
      simple-mtpfs
      tree
      unzip
      usbutils
      vassal
      wineWow64Packages.waylandFull
      winetricks
      wireplumber
      (import (pkgs.fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs";
        rev = "nixos-25.05"; # Try this stable release
        sha256 = "sha256-+jkEZxs7bfOKfBIk430K+tK9IvXlwzqQQnppC2ZKFj4=";
      }) { inherit system; }).k2pdfopt
    ];

    file.".psqlrc".source = ./postgresrc.sql;
  };

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    ssh-agent.enable = true;
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
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
    bat.enable = true;
    fd = {
      enable = true;
      hidden = true;
    };
    home-manager.enable = true;
    firefox.enable = true;
  };

  xdg.userDirs.download = "${config.home.homeDirectory}/files/temp";
}
