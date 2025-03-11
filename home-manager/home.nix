{
  config,
  inputs,
  pkgs,
  ...
}:
{
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
      ripgrep-all
      bitwarden-cli
      bitwarden-desktop
      hyprshot
      brightnessctl
      playerctl
      unzip
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
    firefox.enable = true;
  };

  xdg.userDirs.download = "${config.home.homeDirectory}/files/temp";
}
