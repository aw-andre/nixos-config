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
      vassal
      ripgrep-all
      bitwarden-cli
      bitwarden-desktop
      hyprshot
      brightnessctl
      playerctl
      unzip
      wireplumber
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
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
    bat.enable = true;
    fd.enable = true;
    home-manager.enable = true;
    firefox.enable = true;
  };

  xdg.userDirs.download = "${config.home.homeDirectory}/files/temp";
}
