{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ./kanata.nix ./keyboard.nix ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    kernelParams = [
      "quiet"
      "splash"

      # gpu
      "amdgpu.dc=1"
      "amdgpu.dpm=1"
      "amdgpu.runpm=0"
      "amdgpu.bapm=0"
      "amdgpu.audio=0"
      "amdgpu.ppfeaturemask=0xffffffff"
      "amdgpu.modeset=1"
      "amdgpu_iommu=on"
      "intel_iommu=on"
      "iommu=pt"
      "pci=noaer"
      "pcie_ports=compat"
      "i915.force_probe=*"
      "i915.enable_psr=0"
      "i915.enable_fbc=0"
      "i915.modeset=1"
      "i915.enable_guc=3"
    ];

    initrd.kernelModules = [ "i915" "amdgpu" ];

    consoleLogLevel = 3;

    loader = {
      efi = { efiSysMountPoint = "/boot/efi"; };
      systemd-boot.enable = true;
    };
  };

  networking = {
    hostName = "nixos-mbp";
    networkmanager.enable = true;
  };

  hardware = {
    # gpu
    graphics.enable = true;
    apple-t2.enableIGPU = true;

    # wifi/bluetooth
    firmware = [
      (pkgs.stdenvNoCC.mkDerivation {
        name = "brcm-firmware";
        src = ./firmware/brcm;
        buildCommand = ''
          dir="$out/lib/firmware"
          mkdir -p "$dir"
          cp -r ${./firmware}/* "$dir"
        '';
      })
      pkgs.linux-firmware
    ];

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = { General.FastConnectable = true; };
    };
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    blueman.enable = true;

    openssh = {
      enable = true;
      settings = {
        # PermitRootLogin = "no";
        # PasswordAuthentication = false;
      };

    };

    postgresql = {
      enable = true;
      ensureUsers = [{
        name = "andreaw";
        ensureClauses = {
          superuser = true;
          createrole = true;
          createdb = true;
        };
      }];
      ensureDatabases = [ "andreaw" ];
    };

    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      audio.enable = true;
    };

    udev.extraRules = ''
      SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="low"
    '';
  };

  security.pam.services.hyprlock = { };

  programs = {
    zsh.enable = true;
    thunar.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    hyprlock.enable = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
    (pkgs.stdenv.mkDerivation {
      pname = "my-fonts";
      version = "1.0";
      src = ./fonts;
      installPhase = ''
        mkdir -p $out/share/fonts/
        cp *.otf $out/share/fonts/
      '';
    })
  ];

  environment = {
    systemPackages = with pkgs; [ networkmanagerapplet wl-clipboard ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QUICK_BACKEND = "software";
    };
    etc = {
      "inputrc".text = ''
        set editing-mode vi
        set keymap vi-command
      '';
      "editrc".text = ''
        bind -v
      '';
    };
  };

  virtualisation.docker.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      andreaw = {
        initialPassword = "setyourpassword";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [ ];
        extraGroups = [
          "wheel"
          "video"
          "audio"
          "networkmanager"
          "lp"
          "scanner"
          "dialout"
          "uucp"
          "docker"
        ];
      };
    };
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "25.05";
}
