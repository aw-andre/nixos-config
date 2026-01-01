let
  files = builtins.readDir ./.;

  nixFiles = map (name: ./. + "/${name}") (builtins.filter (name:
    name != builtins.baseNameOf
    (builtins.unsafeGetAttrPos "dummy" { dummy = null; }).file
    && builtins.match ".*\\.nix" name != null) (builtins.attrNames files));
in { inputs, pkgs, lib, ... }: {
  imports = nixFiles;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    kernelParams = [ "quiet" "splash" ];

    consoleLogLevel = 3;

    loader.systemd-boot.enable = true;
  };

  networking.networkmanager.enable = true;

  hardware = {
    # gpu
    graphics.enable = true;

    # wifi/bluetooth
    firmware = [ pkgs.linux-firmware ];

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.FastConnectable = true;
    };
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    blueman.enable = true;
    # envfs.enable = true;

    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    # postgresql = {
    #   enable = true;
    #   ensureUsers = [{
    #     name = "andreaw";
    #     ensureClauses = {
    #       superuser = true;
    #       createrole = true;
    #       createdb = true;
    #     };
    #   }];
    #   ensureDatabases = [ "andreaw" ];
    # };

    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      audio.enable = true;
    };

    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "Hyprland";
          user = "andreaw";
        };
        default_session = initial_session;
      };
    };

    # getty.autologinUser = "andreaw";

    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", ATTRS{idVendor}=="55d4", ATTRS{idProduct}=="0461", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };

  security = {
    pam.services.hyprlock = { };
    sudo.wheelNeedsPassword = false;
  };

  programs = {
    mosh = {
      enable = true;
      openFirewall = false;
    };
    ssh.extraConfig = ''
      Host desktop
        HostName andreaw-home.duckdns.org
        User andreaw
        Port 10000
        IdentityFile ~/files/ssh/desktop

      Host mbp-home
        HostName andreaw-home.duckdns.org
        User andreaw
        Port 11000
        IdentityFile ~/files/ssh/mbp
    '';
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    nix-ld.enable = true;
    thunar.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    dconf.enable = true;
    hyprlock.enable = true;
    zsh.enable = true;
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
    (pkgs.stdenv.mkDerivation {
      pname = "comic-code";
      version = "1.0";
      src = ./fonts;
      installPhase = ''
        mkdir -p $out/share/fonts/
        cp *.otf $out/share/fonts/
      '';
    })
  ];

  environment = {
    systemPackages = with pkgs; [ man-pages tldr ];

    etc = {
      "inputrc".text = ''
        set editing-mode vi
        set keymap vi-command
      '';
      "editrc".text = ''
        edit on
        bind -v
      '';
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      andreaw = {
        initialPassword = "setyourpassword";
        isNormalUser = true;
        extraGroups = [
          "plugdev"
          "wheel"
          "video"
          "audio"
          "networkmanager"
          "lp"
          "scanner"
          "dialout"
          "uucp"
        ];
      };
    };
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "25.05";
}
