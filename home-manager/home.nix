let
  files = builtins.readDir ./.;

  nixFiles = map (name: ./. + "/${name}") (builtins.filter (name:
    name != builtins.baseNameOf
    (builtins.unsafeGetAttrPos "dummy" { dummy = null; }).file
    && builtins.match ".*\\.nix" name != null) (builtins.attrNames files));
in { config, pkgs, ... }: {
  imports = nixFiles ++ [ ./nixvim ./shell ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "andreaw";
    homeDirectory = "/home/andreaw";
    stateVersion = "25.05";

    sessionVariables = {
      PAGER = "vimp";
      MANPAGER = "nvim -c 'Man!'";
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QUICK_BACKEND = "software";
      fl = "/home/andreaw/files";
      bk = "/home/andreaw/files/books";
      cf = "/home/andreaw/files/config";
      pj = "/home/andreaw/files/projects";
      sl = "/home/andreaw/files/school";
      tp = "/home/andreaw/files/temp";
      gm = "/home/andreaw/files/games";
      ds = "/home/andreaw/files/devshells/";
      ms = "/home/andreaw/files/music/";
    };

    packages = with pkgs; [
      bitwarden-cli
      bitwarden-desktop

      brightnessctl
      btop
      dualsensectl
      networkmanagerapplet
      playerctl
      usbutils
      wireplumber
      wl-clipboard

      curl
      wget
      glab

      gemini-cli
      jq
      neovide
      steam-run
      tree
      waypipe

      calibre
      ffmpeg
      hyprshot
      poppler-utils
      ripgrep-all
      unoconv
      unzip
      wineWow64Packages.waylandFull
      zip
    ];

    file = {
      ".psqlrc".text = ''
        \pset pager on
        \setenv PAGER vimt
      '';
      ".icons/default" = {
        recursive = true;
        source = ./macos-cursors;
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
    bat.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fd = {
      enable = true;
      hidden = true;
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    google-chrome.enable = true;
    home-manager.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d";
      flake = "/home/andreaw/files/config";
    };
    nix-index.enable = true;
    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--no-cmd" "--cmd cd" ];
    };
  };

  xdg.userDirs.download = "${config.home.homeDirectory}/files/temp";
}
