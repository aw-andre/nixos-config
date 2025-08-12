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
      gemini-cli
      hyprshot
      jq
      libmtp
      networkmanagerapplet
      playerctl
      poppler-utils
      python313FreeThreading
      python313Packages.ipython
      ripgrep-all
      simple-mtpfs
      tree
      unoconv
      unzip
      usbutils
      vassal
      wineWow64Packages.waylandFull
      winetricks
      wireplumber
      wl-clipboard
      (import (pkgs.fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs";
        rev = "nixos-25.05"; # Try this stable release
        sha256 = "sha256-+jkEZxs7bfOKfBIk430K+tK9IvXlwzqQQnppC2ZKFj4=";
      }) { inherit system; }).k2pdfopt
    ];

    sessionVariables = {
      PAGER = "vimp";
      MANPAGER = "nvim -c 'Man!'";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QUICK_BACKEND = "software";
    };

    file = {
      ".psqlrc".text = ''
        \pset pager on
        \setenv PAGER vimt
      '';
      "ipython_config.py" = {
        text = ''
          c = get_config()
          c.TerminalInteractiveShell.editing_mode = 'vi'
          c.TerminalInteractiveShell.confirm_exit = False
          c.TerminalInteractiveShell.autoindent = True
          c.TerminalInteractiveShell.highlight_matching_brackets = True
        '';
        target = ".ipython/profile_default/ipython_config.py";
      };
    };
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
