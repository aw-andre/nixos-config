{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./direnv.nix
    ./git.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./kitty.nix
    # ./nixvim
    ./qutebrowser.nix
    ./shell
    ./sioyek.nix
    ./waybar.nix
    ./wofi.nix
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
    packages = [
      pkgs.bitwarden-cli
      pkgs.bitwarden-desktop
      pkgs.hyprshot
      pkgs.brightnessctl
      pkgs.playerctl
      pkgs.unzip
      pkgs.wireplumber
      inputs.nixvim.packages.${pkgs.system}.default
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

  programs.home-manager.enable = true;

  xdg.userDirs.download = "${config.home.homeDirectory}/files/temp";
}
